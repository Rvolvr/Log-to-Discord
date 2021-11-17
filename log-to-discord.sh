#!/bin/bash

# Tail will look at the last line(s) in the file established as variable 1, then with the -n switch set to 0 meaning that no previous lines will appear. The -F switch means that it will continuously read the file for changes. 
# Piping that information into a function which will process each line to do what is in the parentheses. 
# The parentheses means that it will send the LINE variable to see if it matches variable 3. 
# After the completion of a grep, that information is sent as an HTML POST protocal, in JSON format.
# Lastly we create the JSON package (with some line modifications) to the URL at variable 2.

# Use: ./log-to-discord.sh <LogFilePath> <DiscordWebHook> <LogKeyword>

tail -n0 -F "$1" | while read LINE; do
  (echo "$LINE" | grep -e "$3") && curl -X POST --silent -H "Content-Type:application/json" \
    --data "{\"content\": \"$(echo $LINE | sed "s/\"/'/g")\"}" "$2";
done
