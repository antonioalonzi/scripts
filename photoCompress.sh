#!/bin/bash

# Create resized folder
mkdir -p resized

# Count photos
count=$(ls -l *.[jJ][pP][gG] 2>/dev/null | wc -l)
echo -e "Found $count Photos.\n"

# Resize photos
i=1
for file in *.[jJ][pP][gG]
do		
	echo "Converting [$i out $count]: $file"
	convert "$file" -resize 4320000@ "resized/$file"
	let i=i+1
done

# Count unprocessed photos
count=$(ls -l *.[jJ][pP][eE][gG] 2>/dev/null | wc -l)
echo -e "\nIgnored $count JPEG Photos."


