#!/bin/bash

# Define input directory and lists
input="$HOME/text_tools_project/sortmfiles"
pronouns_list="i"
pronouns_3rd="we"
negation="not|never|wasn't|couldn't|can't"
filler_words="uh|um|hmm"

# Create output directory
mkdir -p "$HOME/text_tools_project/mresultz+"
output_dir="$HOME/text_tools_project/mresultz+"

# Process files in the input directory
for file in "$input"/*.txt; do
    if [ -f "$file" ]; then
        # Calculate total words
        total_words=$(wc -w < "$file")

        # Count occurrences
        filler_count=$(grep -o -E "$filler_words" "$file" | wc -l)
        pronoun1_count=$(grep -o -E "$pronouns_list" "$file" | wc -l)
        pronoun3_count=$(grep -o -E "$pronouns_3rd" "$file" | wc -l)
        negation_count=$(grep -o -E "$negation" "$file" | wc -l)

        # Calculate proportions using Python
        filler_ratio=$(python3 -c "print($filler_count / $total_words if $total_words else 0)")
        pronoun1_ratio=$(python3 -c "print($pronoun1_count / $total_words if $total_words else 0)")
        pronoun3_ratio=$(python3 -c "print($pronoun3_count / $total_words if $total_words else 0)")
        negation_ratio=$(python3 -c "print($negation_count / $total_words if $total_words else 0)")

        # Define output file for each input file
        output_file="$output_dir/$(basename "$file" .txt)_results.txt"

        # Write to the output file
        echo "File: $(basename "$file")" > "$output_file"
        echo "Total Words: $total_words" >> "$output_file"
        echo "Filler Words: $filler_count ($filler_ratio)" >> "$output_file"
        echo "1st Person Pronouns: $pronoun1_count ($pronoun1_ratio)" >> "$output_file"
        echo "3rd Person Pronouns: $pronoun3_count ($pronoun3_ratio)" >> "$output_file"
        echo "Negation Words: $negation_count ($negation_ratio)" >> "$output_file"
    fi
done

