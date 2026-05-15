# RISC-V Log Analyzer

A shell-based tool that processes RISC-V simulation log files, extracts useful information, and generates human-readable summary reports.

---

## Table of Contents

- [Project Description](#project-description)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Examples](#examples)
- [Sample Output](#sample-output)
- [Makefile Targets](#makefile-targets)

---

## Project Description

`riscv-log-analyzer` parses log files produced by RISC-V simulation runs. It extracts test results (PASS, FAIL, SKIP), computes pass rates, identifies failing tests, and summarizes execution timing statistics. Reports can be written to stdout or saved to a file in plain text or CSV format.

---

## Installation & Setup

**Prerequisites:** `bash`, `grep`, `awk`, `sed`, `git`

1. Clone the repository:
   ```bash
   git clone https://github.com/ahmedhm116/MEDS_training.git
   cd riscv-log-analyzer
   ```

2. Verify all required tools are installed:
   ```bash
   make setup
   ```

3. Make scripts executable:
   ```bash
   chmod +x scripts/*.sh
   ```

---

## Usage

```bash
./scripts/analyze.sh <log-file> [OPTIONS]
```

| Argument | Description |
|---|---|
| `<log-file>` | Path to the simulation log file *(required)* |
| `--format [text\|csv]` | Output format — `text` (default) or `csv` |
| `--output <path>` | Save report to a file instead of stdout |
| `--verbose` | Enable verbose output during analysis |
| `--help` | Print usage information and exit |

---

## Examples

**Basic analysis printed to terminal:**
```bash
./scripts/analyze.sh test_data/sample_fail.log
```

**Save report as a text file:**
```bash
./scripts/analyze.sh test_data/sample_fail.log --output output/report.txt
```

**Export results as CSV:**
```bash
./scripts/analyze.sh test_data/sample_sim.log --format csv --output output/results.csv
```

**Verbose mode:**
```bash
./scripts/analyze.sh test_data/sample_pass.log --verbose
```

**Run analysis on all test data via Make:**
```bash
make all
```

---

## Sample Output

```
=== RISC-V Simulation Log Analysis ===
Log file:      test_data/sample_fail.log
Analysis date: 2026-05-05 14:30:00

--- Results Summary ---
Total tests:   25
Passed:        22 (88.0%)
Failed:         2 ( 8.0%)
Skipped:        1 ( 4.0%)

--- Failed Tests ---
1. rv32i-sll
2. rv32i-beq

--- Timing Statistics ---
Min time:  0.42s (rv32i-nop)
Max time:  2.31s (rv32i-mul)
Avg time:  0.87s

--- Verdict: FAIL ---
Exit code: 1
```

---

## Makefile Targets

| Target | Description |
|---|---|
| `make all` | Run the analyzer on all log files in `test_data/` |
| `make test` | Run analyzer on each test file and verify expected output |
| `make report` | Generate a summary report in `output/` |
| `make clean` | Remove all generated output files |
| `make setup` | Check that all required tools are installed |
| `make help` | Print all available targets with descriptions |

---

## Exit Codes

| Code | Meaning |
|---|---|
| `0` | All tests passed |
| `1` | One or more tests failed |

---

## Author

**AHMED HASHIM**
MEDS Lab — Module 1 Capstone