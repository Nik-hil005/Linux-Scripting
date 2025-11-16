#!/bin/bash

#Check if directory was provided for backup or not
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

SOURCE_DIR=$1
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DEST="$BACKUP_DIR/$(basename "$SOURCE_DIR")_$TIMESTAMP"

# Create backup directory if it doesn't exist already
mkdir -p "$BACKUP_DIR"

cp -r "$SOURCE_DIR" "$DEST"

echo "Backup completed!"
echo "Source: $SOURCE_DIR"
echo "Backup saved to: $DEST"