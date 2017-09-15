#!/bin/bash 

OUTPUT="ID.txt"

while IFS='' read -r line || [[ -n "$line" ]]; do 
  id=$(echo $line | head -n1 | cut -d " " -f1)  
  echo $id >> $OUTPUT
done < "$1"
