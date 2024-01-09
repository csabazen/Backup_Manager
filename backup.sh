#!/bin/bash

# This basic script creates a backup from the given directory or directories and collects simple system informations.

# Target directory
backup_dir="/home/backup"

# Checking whether backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "The backup directory does not exist. Creating..."
    mkdir -p "$backup_dir"
fi

# Backup source directories
source_dirs=("/home/user/dir1" "/home/user/dir2")

# Creating backup
echo "Starting backup..."
for dir in "${source_dirs[@]}"; do
    # Extracting folder name for backup file naming
    folder_name=$(basename "$dir")
    tar -czf "$backup_dir/backup_${folder_name}_$(date +%Y%m%d_%H%M%S).tar.gz" "$dir"
    echo "Backup finished for $dir."
done

# Collecting system information
echo "Collecting system information..."
echo "Hostname: $(uname -n)" > "$backup_dir/system_info.txt"
echo "Operating System Type: $(uname -o)" >> "$backup_dir/system_info.txt"
echo "Kernel Version: $(uname -r)" >> "$backup_dir/system_info.txt"
echo "System Architecture: $(uname -m)" >> "$backup_dir/system_info.txt"
echo "System information saved to: $backup_dir/system_info.txt"

echo "Script execution completed."
