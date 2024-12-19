#!/bin/bash

Input="$HOME/text_tools_project/*+.txt"
Output="$HOME/text_tools_project/m+files"  

mkdir -p "$Output"

for file in $Input; do
    filename=$(basename {m}"$file")
    new_filename="m$filename"
    Output_file="$Output/$new_filename"
   
    grep "^Caller:" "$file" | sed 's/^Caller: //' > "$Output_file"
    sed -E 's/([.?!])/\1\n/g' "$Output_file" | sed '/^[[:space:]]*$/d' > "$Output_file.temp"
    mv "$Output_file.temp" "$Output_file"  

    echo "Processed $file -> $Output_file"
done

