#!/bin/bash

# Directory to store backups
backup_dir="/backup/project1/daily"

# Folder to backup
source_folder="/project/logEld-TenantBackendMicroservices-Company"

# Number of backups to retain
num_backups_to_retain=5

# Get the current date in the format YYYY-MM-DD
current_date=$(date "+%Y-%m-%d")

# Create a backup filename with the date
backup_filename="logEld-TenantBackendMicroservices-Company-$current_date.zip"

# Create a backup of the source folder with the date in the filename
zip -r "$backup_dir/$backup_filename" "$source_folder"

# Remove old backups if there are more than num_backups_to_retain
backup_files=("$backup_dir"/*.zip)
num_backups=${#backup_files[@]}
if [ "$num_backups" -gt "$num_backups_to_retain" ]; then
  num_to_delete=$((num_backups - num_backups_to_retain))
  for ((i = 0; i < num_to_delete; i++)); do
    rm "${backup_files[i]}"
  done
fi

