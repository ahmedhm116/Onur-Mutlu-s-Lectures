#!/bin/bash
# Setting up environment for RISC-V log analysis

# checking if the output directory is created or not, if not create it
if [ -d "output/" ]; then
    echo "Output directory already exists. Skipping creation."
else
    echo "Creating output directory for generated reports."
    mkdir -p output
fi

# ensuring scripts are executable
chmod +x scripts/analyze.sh scripts/generate_report.sh

# verifying if the test data files are present or not
if [ -d "test_data/" ] && [ "$(ls -A test_data)" ]; then
    echo "Test data directory is present and contains files."
else
    echo "Test data directory is missing or empty. Please add the required log files to the test_data directory."
    exit 1
fi

# finished setting up the environment
echo "Environment setup is complete. We can now run the analysis scripts."