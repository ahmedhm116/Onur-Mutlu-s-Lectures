#!/bin/bash
# Script to analyze RISC-V log files and generate reports

set -euo pipefail

show_help(){
    echo "Usage: $0 <log_file> [options]"
    echo "Options:"
    echo " --format [text|csv]  Output format (default: text)"
    echo " --output <path>      Output file path (default: stdout)"
    echo " --verbose            Enable verbose output"
    echo " --help               Print usage information"
}

analyze_log(){
    local input_file="$1"
    
    if [ "$VERBOSE" = true ]; then
        echo "Starting analysis on: $input_file"
    fi

    # Counts - Shielded with || true to prevent set -e from killing the script on 0 matches
    TOTAL=$(grep -c "TEST START:" "$input_file" || true)
    PASS_COUNT=$(grep -c "TEST PASS:" "$input_file" || true)
    FAIL_COUNT=$(grep -c "TEST FAIL:" "$input_file" || true)
    SKIP_COUNT=$(grep -c "TEST SKIP:" "$input_file" || true)

    # Extracting names of failing tests
    FAILING_TESTS=$(grep "TEST FAIL:" "$input_file" | awk '{print $5}' || true)

    # Extracting execution times
    EXEC_TIMES=$(grep -E "TEST (PASS|FAIL):" "$input_file" | sed -n 's/.*(\([0-9.]*\)s).*/\1/p' || true)

    # Calculating statistics
    if [[ -n "$EXEC_TIMES" ]]; then
        AVG_TIME=$(echo "$EXEC_TIMES" | awk '{ sum += $1; n++ } END { if (n > 0) printf "%.2f", sum / n; else print "0" }')
        MAX_TIME=$(echo "$EXEC_TIMES" | sort -n | tail -1)
        MIN_TIME=$(echo "$EXEC_TIMES" | sort -n | head -1)
    else
        AVG_TIME="0" ; MAX_TIME="0" ; MIN_TIME="0"
    fi

    # Calculating pass rate
    if [ "$TOTAL" -gt 0 ]; then
        PASS_RATE=$(( (PASS_COUNT * 100) / TOTAL ))
    else
        PASS_RATE=0
    fi

    # OUTPUT LOGIC
    {
        echo "========================================"
        echo "      RISC-V LOG ANALYSIS REPORT"
        echo "========================================"
        echo "Log File:    $input_file"
        echo "Total Tests: $TOTAL"
        echo "----------------------------------------"
        echo "PASS:        $PASS_COUNT"
        echo "FAIL:        $FAIL_COUNT"
        echo "SKIP:        $SKIP_COUNT"
        echo "Pass Rate:   $PASS_RATE%"
        echo "----------------------------------------"
        echo "Execution Time Stats:"
        echo "  Min: ${MIN_TIME:-0}s"
        echo "  Max: ${MAX_TIME:-0}s"
        echo "  Avg: ${AVG_TIME:-0}s"
        
        if [ "$FAIL_COUNT" -gt 0 ]; then
            echo "----------------------------------------"
            echo "Failing Test List:"
            echo "$FAILING_TESTS"
        fi
        echo "========================================"
    } > "$OUTPUT_FILE"

    # Return the fail count so the main script can decide the exit code
    echo "$FAIL_COUNT"
}

# Error handling for missing log file argument

if [ $# -lt 1 ]; then
    echo "Error: missing log file path"
    show_help ; exit 1
fi

LOG_FILE=$1
shift 

FORMAT="text"
OUTPUT_FILE="/dev/stdout"
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --format)  FORMAT="$2"; shift 2 ;;
        --output)  OUTPUT_FILE="$2"; shift 2 ;;
        --verbose) VERBOSE=true; shift 1 ;;
        --help)    show_help; exit 0 ;;
        *) echo "Unknown option: $1"; show_help; exit 1 ;;
    esac
done

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

analyze_log "$LOG_FILE"

if grep -q "TEST FAIL:" "$LOG_FILE"; then
    if [ "$VERBOSE" = true ]; then echo "Final Status: FAILED"; fi
    exit 1
else
    if [ "$VERBOSE" = true ]; then echo "Final Status: PASSED"; fi
    exit 0
fi