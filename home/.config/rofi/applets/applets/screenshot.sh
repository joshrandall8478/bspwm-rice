#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""
all=""

# Variable passed to rofi
options="$screen\n$area\n$window\n$all"

chosen="$(echo -e "$options" | $rofi_command -p 'spectacle' -dmenu -selected-row 0)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/spectacle ]]; then
			spectacle -m -i -c
    		elif [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; nomacs $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/spectacle ]]; then
			spectacle -r -i -c
	    	elif [[ -f /usr/bin/scrot ]]; then
			scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; nomacs $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/spectacle ]]; then
			spectacle -a -i -c
	    	elif [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; nomacs $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
    $all)
	    	if [[ -f /usr/bin/spectacle ]]; then
			spectacle -f -i -c
		else
			msg
		fi
	;;
esac

