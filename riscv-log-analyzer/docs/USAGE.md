# RISC-V Log Analyzer Command Reference

This document provides a detailed reference for all scripts, arguments, flags, output formats, and Makefile targets in `riscv-log-analyzer`.

---

## Table of Contents

- [analyze.sh](#analyzesh)
- [setup_env.sh](#setup_envsh)
- [Makefile Targets](#makefile-targets)

---

## analyze.sh

The main script. Accepts a log file and optional flags to control output format and verbosity.

### Syntax

```bash
./scripts/analyze.sh <log-file> [OPTIONS]
```

### Commands

The commands are given below:

### `--format`

Controls how the report is formatted.

**text** *(default)*
Human-readable report with aligned columns and section headers.
```bash
./scripts/analyze.sh test_data/sample_sim.log --format text
```

**csv**
Comma-separated values. Useful for importing into spreadsheets or other tools.
```bash
./scripts/analyze.sh test_data/sample_sim.log --format csv
```

### `--output`

By default the report is printed to stdout. Use `--output` to save it to a file instead.

```bash
./scripts/analyze.sh test_data/sample_fail.log --output output/report.txt
```

```bash
./scripts/analyze.sh test_data/sample_fail.log --format csv --output output/results.csv
```

> The `output/` directory must exist before running. Run `make setup` or `mkdir -p output/` to create it.

### `--verbose`

Prints additional information during analysis — useful for debugging or understanding what the script is doing step by step.

```bash
./scripts/analyze.sh test_data/sample_sim.log --verbose
```

Verbose output includes:
- The log file being read
- Each test parsed and its result
- Timing value extracted per test
- Final counts before generating the report

### `--help`

Prints usage information and exits immediately. No log file is required.

```bash
./scripts/analyze.sh --help
```

### Combined Flags Example

```bash
./scripts/analyze.sh test_data/sample_fail.log --format csv --output output/results.csv --verbose
```

---

## setup_env.sh

Checks that all tools required by the project are installed and available in your `PATH`.

### Syntax

```bash
./scripts/setup_env.sh
```

### What it checks

| Tool | Purpose |
|---|---|
| `bash` | Required to run all scripts |
| `grep` | Pattern matching inside log files |
| `awk` | Field extraction and arithmetic |
| `sed` | Text substitution and cleanup |
| `git` | Version control |

If any tool is missing, the script prints an error and exits with code `1`.

---

## Makefile Targets

Run any target with:
```bash
make <target>
```

### `make all`
Runs `analyze.sh` on every `.log` file inside `test_data/` and prints results to stdout.

```bash
make all
```

### `make test`
Runs the analyzer on each test file in `test_data/` and checks that the output matches expected results. Exits with code `1` if any check fails.

```bash
make test
```

### `make report`
Calls `generate_report.sh` to produce individual and combined reports in `output/`.

```bash
make report
```

### `make clean`
Deletes everything inside `output/`. Does not remove the directory itself.

```bash
make clean
```

### `make setup`
Runs `setup_env.sh` to verify all required tools are installed.

```bash
make setup
```

### `make help`
Prints a list of all available Makefile targets with short descriptions.

```bash
make help
```
