.PHONY: setup

setup:
	@echo "Checking the required tools"
	@command -v bash >/dev/null 2>&1 || { echo >&2 "Bash is required but it's not installed. Aborting."; exit 1; }
	@command -v awk >/dev/null 2>&1 || { echo >&2 "Awk is required but it's not installed. Aborting."; exit 1; }
	@command -v grep >/dev/null 2>&1 || { echo >&2 "Grep is required but it's not installed. Aborting."; exit 1; }
	@chmod +x scripts/setup_env.sh
	@echo "Environment setup complete. You can now run the analysis scripts."