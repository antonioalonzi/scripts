#!/bin/bash
for file in *.[jJ][pP][gG] *.[jJ][pP][eE][gG]
do
	mkdir -p resized
	convert "$file" -resize 4320000@ "resized/$file"
done
