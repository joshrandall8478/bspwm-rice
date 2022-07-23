#!/bin/sh
testyakuake=`pgrep -u $UID -x yakuake`

if [ "$testyakuake" == "" ]; then
	echo "%{F#ff8000}%{F-} Yakuake Closed"
else
	echo ""
fi
