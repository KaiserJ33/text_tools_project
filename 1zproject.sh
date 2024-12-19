Input="$HOME/text_tools_project/sortm+files/"

#filler_words="uh|um|hmm"
#pronouns_list="i"
pronouns_3rd="we"
negation="not|never|wasn't|couldn't|can't"


#mkdir -r $HOME/text_tools_project/m+results
#$Output=$(touch "$HOME/text_tools_ptoject/m+results/output.txt")

#> $Output

for file in "$Input"/*.txt; do
  if [ -f "$file" ]; then
    total_words=$(wc -w < "$file")

    filler_count=$(egrep -o "(uh|um|hmm)" "$file" | wc -l) 
    pronoun1_count=$(egrep -o 'i' $file | wc -l) 
    pronoun3_count=$(egrep -o "$pronouns_3rd" "$file" | wc -l)
    negation_count=$(egrep -o "$negation" "$file" | wc -l)

    Pronoun_1stratio=$(python3 -c "print($pronoun1_count / $total_words)" >> OutputA+.txt)
    Pronoun_1stratio=$(python3 -c "print($filler_count / $total_words)" >> OutputA+.txt)
    Pronoun_1stratio=$(python3 -c "print($pronoun3_count / $total_words)" >> OutputA+.txt)
    Pronoun_1stratio=$(python3 -c "print($negation_count / $total_words)" >> OutputA+.txt)

    #Repeat above above with other categories 

    echo "File: $(basename "$file")" > OutputA+.txt
    echo "Total Words: $total_words" > OutputA+.txt
    echo "Filler Words: $filler_count" > OutputA+.txt
    echo "1st Person Pronouns: $pronoun1_count" >> OutputA+.txt
    echo "3rd Person Pronouns: $pronoun3_count" >> OutputA+.txt
    echo "Negation Words: $negation_count" >> OutputA+.txt
    #echo "" >> #"$Output"
  fi
done


#MLUSLI=$(python3 -c "print($tokenSLI / $UTTERSLI)")

