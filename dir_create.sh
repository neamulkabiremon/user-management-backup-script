#!/bin/bash

# **Explanation:** This line tells the system to use the Bash interpreter to run this script.

# **Check for correct number of arguments**
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <directory_name> <start_number> <end_number>"
  echo "  - <directory_name>: The base name for the directories (e.g., 'data')"
  echo "  - <start_number>: The starting number for the sequence (e.g., 1)"
  echo "  - <end_number>: The ending number for the sequence (e.g., 10)"
  exit 1
fi

# **Extract arguments into variables**
directory_name="$1"
start_number="$2"
end_number="$3"

# **Validate start and end number order**
if [ "$start_number" -gt "$end_number" ]; then
  echo "Error: Start number ($start_number) must be less than or equal to end number ($end_number)."
  exit 1
fi

# **Loop to create directories**
for ((i = start_number; i <= end_number; i++)); do
  # **Construct the directory name with sequence number**
  dir_name="$directory_name""$i"

  # **Create the directory with informative message**
  mkdir -p "$dir_name" && echo "Created directory: $dir_name"  # Use '-p' for parent directory creation
done

echo "All directories created successfully!"  # Added success message
