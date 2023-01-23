#!/bin/bash

file=$1
dir=./exe

links=$(grep -o "<fileName>.*</fileName>" $file | grep -o "http.*" | sed "s/<\/fileName>//g" | sed "s/<fileName>//g")

for link in $links
do
    aria2c -d $dir -o $(basename $link) $link
done
