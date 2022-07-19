#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#66ffffff} Off"
else
   if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
   then	
    	echo " On"
   fi
  echo "%{F#FCDE64}%{F-} Connected"
  device=`bluetoothctl info | grep Alias: | sed 's/Alias://g'`
  #notify-send --icon=~/.config/polybar/scripts/.bluetooth.png "Bluetooth Device Connected" "$device" -u normal
fi
