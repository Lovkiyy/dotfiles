#!/bin/sh
C=0
while [ $C -lt 255 ]; do
    tput setab $C
    echo -n "$C "
    C=$((C + 1))
done
tput sgr0
echo
