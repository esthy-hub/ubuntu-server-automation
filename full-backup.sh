#!/bin/bash
BACKUP_DIR="$HOME/server-backups"
SITE_DIR="$HOME/client-website"
DB_NAME="client_store"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR" "$SITE_DIR"

# 1. Compress website files
tar -czf "$BACKUP_DIR/website-$TIMESTAMP.tar.gz" "$SITE_DIR"

# 2. Dump and compress MySQL database securely
mysqldump --defaults-extra-file="$HOME/.my.cnf" "$DB_NAME" | gzip > "$BACKUP_DIR/db-$TIMESTAMP.sql.gz"

# 3. Auto-delete backups older than 7 days
find "$BACKUP_DIR" -type f \( -name "*.tar.gz" -o -name "*.sql.gz" \) -mtime +7 -delete

echo "Full backup (Website + MySQL) completed at $TIMESTAMP" >> "$BACKUP_DIR/backup.log"
