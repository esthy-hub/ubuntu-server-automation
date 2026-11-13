#!/bin/bash
BACKUP_DIR="$HOME/server-backups"
SOURCE_DIR="$HOME/client-website"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

tar -czf "$BACKUP_DIR/site-backup-$TIMESTAMP.tar.gz" "$SOURCE_DIR"
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete
echo "Backup completed at $TIMESTAMP" >> "$BACKUP_DIR/backup.log"
