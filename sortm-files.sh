#!/bin/bash

Input="$HOME/text_tools_project/m-files"
Output="$HOME/text_tools_project/sort-mfiles"

mkdir -p "$Output"

for file in "$Input"/*; do
    filename=$(basename "$file")
    new_filename="S$filename"
    output_file="$Output/$new_filename"

    echo "Processing file: $file"

    cat "$file" |
    tr '[:upper:]' '[:lower:]' |
    tr -sc "[:alpha:]'" '\n' |
    sort > "$output_file"

    echo "Processed $file > $output_file"
done


