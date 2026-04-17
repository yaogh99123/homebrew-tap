#!/bin/bash

# 仅进行离线语法和结构检查
set -e

FORMULA_NAME=$1

if [ -z "$FORMULA_NAME" ]; then
    echo "Usage: $0 <formula_name>"
    echo "Example: $0 phpantom_lsp"
    exit 1
fi

FORMULA_PATH="Formula/${FORMULA_NAME}.rb"

if [ ! -f "$FORMULA_PATH" ]; then
    echo "Error: Formula file not found at $FORMULA_PATH"
    exit 1
fi

echo "==> Checking Ruby syntax for $FORMULA_NAME..."
if ruby -c "$FORMULA_PATH" > /dev/null; then
    echo "OK: Syntax is valid."
else
    echo "ERROR: Syntax check failed."
    exit 1
fi

echo "==> Checking class name consistency..."
# 从文件名推导类名 (下划线转大驼峰)
EXPECTED_CLASS=$(echo "$FORMULA_NAME" | perl -pe 's/(^|_)([a-z])/\u$2/g')
if grep -q "class $EXPECTED_CLASS < Formula" "$FORMULA_PATH"; then
    echo "OK: Class name '$EXPECTED_CLASS' matches formula name."
else
    echo "WARNING: Class name may not match formula name '$FORMULA_NAME'."
fi

echo "==> Done. $FORMULA_NAME is ready for commit (Offline check)."
