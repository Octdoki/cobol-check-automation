#!/bin/bash
set -e  # 실패 시 즉시 종료

# 사용자 이름 소문자로 변환
LOWERCASE_USERNAME=$(echo "$ZOWE_USERNAME" | tr '[:upper:]' '[:lower:]')
USS_PATH="/z/${LOWERCASE_USERNAME}/cobolcheck"

echo "📁 Checking if directory exists on USS: $USS_PATH"

# 디렉터리 존재 확인 후 없으면 생성
if ! zowe zos-files list uss-files "$USS_PATH" >/dev/null 2>&1; then
  echo "Directory does not exist. Creating it..."
  zowe zos-files create uss-directory "$USS_PATH"
else
  echo "✅ Directory already exists: $USS_PATH"
fi

# ✅ 업로드 실행 (공백/줄바꿈 없이 한 줄로)
echo "📤 Uploading COBOL Check files to $USS_PATH ..."
zowe zos-files upload dir-to-uss "./cobol-check" "$USS_PATH" --recursive --binary

# ✅ 업로드 검증
echo "📋 Verifying upload..."
zowe zos-files list uss-files "$USS_PATH"
echo "✅ Upload complete!"
