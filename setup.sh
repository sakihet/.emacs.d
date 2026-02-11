#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/.emacs.d"

echo "Setting up symbolick link..."

if [ -e "$TARGET" ]; then
    if [ -L "$TARGET" ]; then
        echo "Symbolic link already exists"
    else
        echo "Error"
        exit 1
    fi
else
    ln -s "$SCRIPT_DIR" "$TARGET"
    echo "Success"
fi
