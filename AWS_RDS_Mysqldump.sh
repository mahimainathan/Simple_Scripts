#!/bin/bash

# Set the variables for the RDS instance
RDS_HOST="rds-instance-endpoint"
RDS_USER="rds-username"
RDS_PASSWORD="rds-password"
RDS_DB="rds-database-name"
BACKUP_DIR="/path/to/backup/dir"

# Create a new backup file with a timestamp
BACKUP_FILE="${BACKUP_DIR}/${RDS_DB}_$(date +%Y-%m-%d_%H-%M-%S).sql"

# Use the mysqldump command to backup the RDS instance
mysqldump -h ${RDS_HOST} -u ${RDS_USER} -p${RDS_PASSWORD} ${RDS_DB} > ${BACKUP_FILE}

# Add a check for mysqldump exit code
if [ $? -eq 0 ]; then
    echo "Backup succeeded"
else
    echo "Backup failed"
fi 
