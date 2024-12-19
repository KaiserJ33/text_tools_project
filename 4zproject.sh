#!/bin/bah

# Define input directory and lists
input="$HOME/text_tools_project/sortm+files"
negation="not|never|wasn't|couldn't|can't"
mkdir -p "$HOME/text_tools_project/mresultz+"
output_dir="$HOME/text_tools_project/mresultz+"

echo "filler_count,filler_ratio" > "$output_dir/filler_words.txt"
echo "pronoun1_count,pronoun1_ratio" > "$output_dir/pronoun1.txt"
echo "pronoun3_count,pronoun3_ratio" > "$output_dir/pronoun3.txt"
echo "negation_count,negation_ratio" > "$output_dir/negation.txt"
echo "unique_words,lex_diversity" > "$output_dir/lex_div.txt"

for file in "$input"/*.txt; do
    if [ -f "$file" ]; then
        total_words=$(wc -w < "$file")

        unique_words=$(uniq "$file" | wc -l)

        lex_diversity=$(python3 -c "print($unique_words / $total_words if $total_words else 0)")

        filler_count=$(egrep -o "(uh|um|hmm)" "$file" | wc -l)
        pronoun1_count=$(egrep -o "(i)" "$file" | wc -l)
        pronoun3_count=$(egrep -o "(he|she|they)" "$file" | wc -l)
        negation_count=$(egrep -o "$negation" "$file" | wc -l)

        filler_ratio=$(python3 -c "print($filler_count / $total_words if $total_words else 0)")
        pronoun1_ratio=$(python3 -c "print($pronoun1_count / $total_words if $total_words else 0)")
        pronoun3_ratio=$(python3 -c "print($pronoun3_count / $total_words if $total_words else 0)")
        negation_ratio=$(python3 -c "print($negation_count / $total_words if $total_words else 0)")

        echo "$filler_count,$filler_ratio" >> "$output_dir/filler_words+.txt"
        echo "$pronoun1_count,$pronoun1_ratio" >> "$output_dir/pronoun1+.txt"
        echo "$pronoun3_count,$pronoun3_ratio" >> "$output_dir/pronoun3+.txt"
        echo "$negation_count,$negation_ratio" >> "$output_dir/negation+.txt"
        echo "$unique_words,$lex_diversity" >> "$output_dir/lex_div+.txt"
    fi
done

