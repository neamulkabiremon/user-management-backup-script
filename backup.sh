#!/bin/bash

#  **Explanation:** This line tells the system to use the Bash interpreter to run this script.

# **Set the source directory to backup (modify this path)**
source_directory="/path/to/your/source"

# **Explanation:** This line defines a variable `source_directory` and assigns the path to the folder containing the files you want to back up. You'll need to replace `/path/to/your/source` with the actual location of your source folder.

# **Set the backup directory (modify this path)**
backup_directory="/path/to/your/backup"

# **Explanation:** This line defines a variable `backup_directory` and assigns the path to the folder where you want to store the compressed backup file. You'll need to replace `/path/to/your/backup` with the desired location for the backup files.

# **Create a timestamp to include in the backup folder name**
timestamp=$(date +%Y%m%d%H%M%S)

# **Explanation:** This line uses the `date` command with the format specifier `+%Y%m%d%H%M%S` to generate a unique timestamp based on the current date and time (YYYYMMDDHHMMSS format). This timestamp will be appended to the backup filename, making it easy to identify different backups.

# **Create a backup file with a timestamp**
final_file="$backup_directory/file_backup-$timestamp.tgz"

# **Explanation:** This line constructs the complete filename for the backup archive. It combines the `backup_directory` with the string "file_backup-", the generated `timestamp`, and the `.tgz` extension, indicating a compressed TAR archive (GZIP compressed).

# **Create the backup**
if tar czf "$final_file" -C "$source_directory" .; then
  echo "Backup Complete!"  # Use exclamation mark for better readability
else
  echo "Backup Failed. Please check the script for errors."
fi

# **Explanation:** This `if` statement attempts to create the backup archive using the `tar` command. Here's a breakdown of the options used:
  - `c`: Create a new archive
  - `z`: Compress the archive using GZIP
  - `f`: Specify the output filename (`$final_file`)
  - `-C`: Change directory to the source directory (`$source_directory`) before archiving (`.` refers to the current directory within the source)

  The `if` statement checks the return code of the `tar` command. If the command succeeds (exit code 0), the "Backup Complete!" message is displayed. Otherwise, the "Backup Failed..." message is shown, prompting you to review the script for any issues.
