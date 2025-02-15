#!/bin/bash

# Define directories
LOG_DIR="Project/data/logs"
OUTPUT_FILE="Project/data/logs-recent.txt"

# Find the 10 most recent .log files, sort by modification time (newest first)
LOG_FILES=$(ls -t "$LOG_DIR"/*.log 2>/dev/null | head -n 10)

# Check if there are log files
if [ -z "$LOG_FILES" ]; then
    echo "No log files found." > "$OUTPUT_FILE"
    exit 1
fi

# Extract first lines and save to output file
> "$OUTPUT_FILE"  # Clear existing content
for file in $LOG_FILES; do
    head -n 1 "$file" >> "$OUTPUT_FILE"
done

echo "Extracted first lines from 10 most recent log files."