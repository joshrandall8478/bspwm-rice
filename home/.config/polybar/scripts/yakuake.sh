#!/bin/sh
testyakuake=`pgrep -u $UID -x yakuake`

if [ "$testyakuake" == "" ]; then
	echo "%{F#66ffffff}"
else
	echo "%{F#2193ff}"
fi
