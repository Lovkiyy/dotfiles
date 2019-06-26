#!/bin/sh
if [ $ZZZ_MODE != suspend ]; then
	exit 0
fi

physlock -dms

