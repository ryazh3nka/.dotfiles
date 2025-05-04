#!/bin/bash

# removes file:// prefix if present
DIR="${1#file://}"

# if it's a file, gets its directory
if [ -f "$DIR" ]; then
    DIR=$(dirname "$DIR")
fi

# launches foot with ranger opened
foot --app-id ranger-float -T "ranger-float" -e ranger "$DIR"
