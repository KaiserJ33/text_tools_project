#!/bin/bash

Input="$HOME/text_tools_project/*+.txt"


for file in $Input/*; do
	filename=$(basename "$file")
    
    Output_file="$Output/modified_$filename"
    
    Output_file="${file//.txt/-modified.txt}"
    
    
    grep "^Caller" "$file" > "$Output_file"
    echo "Processed $file -> $Output_file"
done    
