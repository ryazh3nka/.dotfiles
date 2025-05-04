#!/bin/bash

# Converts file paths to "file://" format
entries=""
for file in "$@"; do
    abs_path=$(realpath "$file")
    entries+="file://$abs_path"$'\n'
done

# Copy to clipboard as text/uri-list
wl-copy --type text/uri-list <<< "$entries"
