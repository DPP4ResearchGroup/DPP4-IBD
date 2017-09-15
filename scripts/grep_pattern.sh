#!/bin/bash

IDINPUTFILE=$1
DATAINPUTFILE=$2
OUTPUTFILE=$3

while IFS='' read -r line; do 
  id=$(awk '{print $1;}')
  grep "^${id}" $2 > $3
done < $1

