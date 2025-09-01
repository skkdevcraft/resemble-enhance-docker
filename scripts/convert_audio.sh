#!/bin/bash

# for debugging
# set -x -v 

EXT=$1
INPUT_DIR=${2:-./input}

echo "$EXT" | grep -Eiq "^[a-z][0-9a-z]{2}[a-z]?"
if [[ $? -ne 0 || $# -lt 1 || $# -gt 2 || ! -d $INPUT_DIR ]]; then
    echo -e "\x1B[4;1;36mUsage:\x1B[0;1m $0 ext [input_dir]\x1B[0m"
    echo -e "- if left empty, \x1B[93minput_dir\x1B[0m defaults to \x1B[4m./input\x1B[0m"
    echo -e "- \x1B[93mext\x1B[0m can be any of the input extensions/formats supported by \x1B[4mffmpeg\x1B[0m"
    echo -e "\x1B[90m(mp3, m4a, aac, ogg, flac, aiff, wma, ac3, opus, alac)\x1B[0m"
    exit 1
fi

shopt -s nullglob

cd $INPUT_DIR && files=(*."$EXT")
file_count=${#files[@]}
if [[ $file_count -eq 0 ]]; then
    echo -e "No files with the extension \x1B[93m$EXT\x1B[0m found in \x1B[93m$INPUT_DIR\x1B[0m"
    exit 1
fi

echo -e "Found \x1B[4m$file_count files\x1B[0m in the input directory..."

for i in "${files[@]}"; do 
if [[ ! -f "$i.wav" ]]; then
    ffmpeg -hide_banner -loglevel error -i "$i" "$i.wav"
    if [[ $? -eq 0 ]]; then 
        echo -e "\x1B[32;1m- File '$i' converted successfully\x1B[0m"
    else
        echo -e "\x1B[31;1m- Conversion of file '$i' failed\x1B[0m"
    fi
else
    echo -e "\x1B[90m- File '$i.wav' already exists, skipping...\x1B[0m"
fi
done
