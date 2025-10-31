#!/bin/bash
set -e  # Stop if any command fails

# Convert username to lowercase
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')

USS_PATH="/z/$LOWERCASE_USERNAME/cobolcheck"

echo "📁 Checking if directory exists on USS: $USS_PATH"

# Check if directory exists, create if it doesn’t
if ! zowe zos-files list uss-files "$USS_PATH" &>/dev/null; then
  echo "Directory does not exist. Creating it..."
  zowe zos-files create uss-directory "$USS_PATH"
else
  echo "✅ Directory already exists."
fi

# Upload COBOL Check folder recursively
echo "📤 Uploading COBOL Check files to $USS_PATH ..."
zowe zos-files upload dir-to-uss "./cobol-check" "$USS_PATH" --recursive --binary-files

# Verify upload
echo "📋 Verifying upload:"
zowe zos-files list uss-files "$USS_PATH"
echo "✅ Upload complete."
