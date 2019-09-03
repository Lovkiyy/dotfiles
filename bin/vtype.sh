#!/bin/sh
file=$(mktemp /tmp/vtype.XXXXX)

xclip -o -selection clipboard > $file

# For some reason i can't fold file in place
change=$(fold -w 72 -s $file)
echo "$change" > $file
sed -i "s/—/-/;s/—/-/;s/…/.../;s/’/\'/;s/–/-/;s/–/-/;s/’/\'/;s/’/\'/;s/‘/\'/;s/”/\"/;s/“/\"/;s/‘/\'/;s/’/\'/;s/–/-/;s/^[ \t]*//;s/[ \t]*$//g" "$file"

nvim -c ":set noequalalways" -d $file " "
rm -f $file
