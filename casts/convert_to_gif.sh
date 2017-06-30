#!/bin/bash
# This uses aciicase2gif: https://github.com/asciinema/asciicast2gif



FILES=$(ls *.json)

for FILE in $FILES; do
  asciicast2gif $FILE ${FILE%.*}.gif
done










