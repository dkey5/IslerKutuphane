#!/bin/bash

file=./$1
dir=./png

links=$(grep -o "<source>.*</source>" $file | grep -o "http.*" | sed "s/<\/source>//g" | sed "s/<source>//g")

for link in $links
do
    aria2c -d $dir -o $(basename $link) $link
done
