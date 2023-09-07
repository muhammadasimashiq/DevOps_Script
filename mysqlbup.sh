#!/bin/bash

# Database connection details
db_user="asim"
db_password="Asim.jutt23"
db_name="mydbs"

# Directory to store backups
backup_dir="/path/to/backup/directory"

# Get the current date in the format YYYY-MM-DD
current_date=$(date "+%Y-%m-%d")

# Create a backup filename with the date
backup_filename="$db_name-$current_date.sql"

# Perform the database backup
mysqldump -u"$db_user" -p"$db_password" "$db_name" > "$backup_dir/$backup_filename"

# Compress the backup file
zip "$backup_dir/$backup_filename.zip" "$backup_dir/$backup_filename"

# Remove the uncompressed backup file (optional)
rm "$backup_dir/$backup_filename"

