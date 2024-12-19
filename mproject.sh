#!/bin/bash


Input="~/text_tools_project/*+.txt"
Output="~/text_tools_project/m*+.txt"

for file in $Input/*; do
	filename=$(basename "$file")

	Output_file="$Output/modified_$filename"

	grep "^Caller" "$file" > "$Output_file"
	echo "Processed $file -> $Output_file"
done
