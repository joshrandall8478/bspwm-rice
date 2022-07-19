#!/bin/sh
testyakuake=`pgrep -u $UID -x yakuake`

if [ "$testyakuake" == "" ]; then
	yakuake &
	exec yakuake
else
  	exec yakuake
fi
