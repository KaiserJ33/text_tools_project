#!/bin/bash
paste -d, "$HOME/text_tools_project/mresultsf/filler_wordsf.txt" \
          "$HOME/text_tools_project/mresultsf/pronounif.txt" \
	  "$HOME/text_tools_project/mresultsf/pronounwef.txt" \
	  "$HOME/text_tools_project/mresultsf/pronounhef.txt" \
          "$HOME/text_tools_project/mresultsf/pronountheyf.txt" \
          "$HOME/text_tools_project/mresultsf/negationf.txt" \
          "$HOME/text_tools_project/mresultsf/lex_divf.txt" \
          > "$HOME/text_tools_project/paste_finf.txt"

