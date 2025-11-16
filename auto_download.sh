#!/bin/bash

FILE_URL="https://example.com/file.zip"

# Destination to save the download
DOWNLOAD_DIR="$HOME/downloads_auto"

# Create folder if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

echo "Starting download..."
echo "URL: $FILE_URL"
echo "Saving to: $DOWNLOAD_DIR"

# Use wget if available, otherwise use curl
if command -v wget >/dev/null 2>&1; then
    wget -P "$DOWNLOAD_DIR" "$FILE_URL"
elif command -v curl >/dev/null 2>&1; then
    curl -o "$DOWNLOAD_DIR/file.zip" "$FILE_URL"
else
    echo "Neither wget nor curl is installed!"
    exit 1
fi

echo "Download complete!"