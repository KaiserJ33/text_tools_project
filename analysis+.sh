#!/bin/bash

Input="$HOME/text_tools_project/sortm+files"
negation="not|never|nothing|don't|wasn't|didn't|couldn't|can't"
mkdir -p "$HOME/text_tools_project/mresults+"
Output="$HOME/text_tools_project/mresults+"

echo "file_name,filler_ratio," > "$Output/filler_words+.txt"
echo "pronouni_ratio," > "$Output/pronouni+.txt"
echo "pronounwe_ratio," > "$Output/pronounwe+.txt"
echo "pronounhe_ratio," > "$Output/pronounhe+.txt"
echo "pronounthey_ratio," > "$Output/pronounthey+.txt"
echo "negation_ratio," > "$Output/negation+.txt"
echo "lex_diversity" > "$Output/lex_div+.txt"

for file in "$Input"/*.txt; do
    if [ -f "$file" ]; then

        total_words=$(wc -w < "$file")

        unique_words=$(uniq "$file" | wc -l)

        lex_diversity=$(python3 -c "print($unique_words / $total_words if $total_words else 0)")

        filler_count=$(grep -o -E "(huh|uh|um|hmm)" "$file" | wc -l)
        pronouni_count=$(grep -o -E "(i|my|mine)" "$file" | wc -l)
        pronounwe_count=$(grep -o -E "(we|us|our|ours)" "$file" | wc -l)
	pronounhe_count=$(grep -o -E "(he|him|his|she|her|hers)" "$file" | wc -l)
	pronounthey_count=$(grep -o -E "(they|them|their|theirs)" "$file" | wc -l)
        negation_count=$(grep -o -E "$negation" "$file" | wc -l)

        filler_ratio=$(python3 -c "print($filler_count / $total_words if $total_words else 0)")
        pronouni_ratio=$(python3 -c "print($pronouni_count / $total_words if $total_words else 0)")
        pronounwe_ratio=$(python3 -c "print($pronounwe_count / $total_words if $total_words else 0)")
	pronounhe_ratio=$(python3 -c "print($pronounhe_count / $total_words if $total_words else 0)")
	pronounthey_ratio=$(python3 -c "print($pronounthey_count / $total_words if $total_words else 0)")
        negation_ratio=$(python3 -c "print($negation_count / $total_words if $total_words else 0)")

        echo "$(basename "$file"),$filler_ratio," >> "$Output/filler_words+.txt"
        echo "$pronouni_ratio," >> "$Output/pronouni+.txt"
        echo "$pronounwe_ratio," >> "$Output/pronounwe+.txt"
	echo "$pronounhe_ratio," >> "$Output/pronounhe+.txt"
	echo "$pronounthey_ratio," >> "$Output/pronounthey+.txt"
        echo "$negation_ratio," >> "$Output/negation+.txt"
        echo "$lex_diversity" >> "$Output/lex_div+.txt"
    fi
done


