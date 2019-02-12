#!/bin/sh
file=$(mktemp /tmp/vtype.XXXXX)
xsel -p -o > $file
sed -i 's/^[ \t]*//;s/[ \t]*$//g' "$file"
change=$(fold -w 80 -s $file)
echo -e "$change" > $file
nvim -d $file " "
cat $file
rm -f $file
