#!/bin/bash
# utility for renaming bunch of files
# optional --dry doesn't move just prints
# $1 list of files (newline separated)
# $2 from pattern
# $3 to pattern

DRY=false
if [ "$1" == "--dry" ]; then
  DRY=true
  shift
fi

IFS=$'\n'
for i in $1; do 
  j=`echo "$i" | sed "s/$2/$3/g" - ` ; 
  if $DRY; then
    echo \"$i\" \"$j\"; 
  else
    echo \"$i\" \"$j\"; 
    mv "$i" "$j"; 
  fi
done
