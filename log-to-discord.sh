#!/bin/bash

tail -n0 -F "$1" | while read LINE; do
  (echo "$LINE" | grep -e "$3") && curl -X POST --silent -H "Content-Type:application/json" \
    --data "{\"content\": \"$(echo $LINE | sed "s/\"/'/g")\"}" "$2";
done
