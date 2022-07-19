#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/archmenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.config/rofi/bin/usedcpu)
memory=$($HOME/.config/rofi/bin/usedram)

# Options
powermenu=""
shortcuts=""
quicklinks=""
dmenu=""
screenshot=""
hotkeys=""

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $HOME/.config/rofi/applets/styles/confirm.rasi
}

# Message
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$powermenu\n$shortcuts\n$quicklinks\n$screenshot\n$hotkeys"

chosen="$(echo -e "$options" | $rofi_command -p "CPU: $cpu | RAM: $memory" -dmenu -selected-row 0)"
case $chosen in
    $powermenu)
		sh ~/.config/rofi/applets/applets/powermenu.sh &
	;;
    $shortcuts)
		sh ~/.config/rofi/applets/applets/apps.sh &
   	;;
    $quicklinks)
		sh ~/.config/rofi/applets/applets/quicklinks.sh &
        ;;
    $dmenu)
		rofi -modi drun,window,filebrowser -show &
	;;
    $screenshot)
	    	sh ~/.config/rofi/applets/applets/screenshot.sh &
	;;
    $hotkeys)
	    	kitty vim -R ~/.config/sxhkd/sxhkdrc &
	;;
esac
