#!/bin/sh
file=$(mktemp /tmp/vtype.XXXXX)

xsel -b -o > $file

# For some reason i can't fold file in place
change=$(fold -w 80 -s $file)
echo -e "$change" > $file
sed -i 's/^[ \t]*//;s/[ \t]*$//g' "$file"

nvim -d $file " "
rm -f $file
