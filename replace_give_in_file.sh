#!/usr/bin/env bash

# Check if filename was given
FILE="$1"

if [ -z "$FILE" ]; then
    echo "Usage: ./replace_give_in_file.sh <filename>"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

# Replace "give" with "learning" from line 5 onwards only in lines containing "welcome"
awk 'NR < 5 {
        print; next;
     }
     /welcome/ {
        gsub(/give/, "learning");
     }
     { print }' "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

echo "Replacement completed in file: $FILE"

