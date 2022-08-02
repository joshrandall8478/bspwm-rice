#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
music=""
settings=""
discord=""
obs=""
mail=""
keepass=""
# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$browser\n$files\n$music\n$discord\n$keepass\n$mail"

#options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Shortcuts" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
		if [[ -f /usr/bin/termite ]]; then
			termite &
		elif [[ -f /usr/bin/urxvt ]]; then
			urxvt &
		elif [[ -f /usr/bin/kitty ]]; then
			kitty &
		elif [[ -f /usr/bin/xterm ]]; then
			xterm &
		elif [[ -f /usr/bin/xfce4-terminal ]]; then
			xfce4-terminal &
		elif [[ -f /usr/bin/gnome-terminal ]]; then
			gnome-terminal &
		else
			msg "No suitable terminal found!"
		fi
        ;;
    $files)
		if [[ -f /usr/bin/dolphin ]]; then
			dolphin &
	    	elif [[ -f /usr/bin/nemo ]]; then
			nemo &
		elif [[ -f /usr/bin/thunar ]]; then
			thunar &
		else
			msg "No suitable file manager found!"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/geany ]]; then
			geany &
		elif [[ -f /usr/bin/leafpad ]]; then
			leafpad &
		elif [[ -f /usr/bin/mousepad ]]; then
			mousepad &
		elif [[ -f /usr/bin/code ]]; then
			code &
		else
			msg "No suitable text editor found!"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/firefox ]]; then
			firefox &
    		elif [[ -f /usr/bin/google-chrome-stable ]]; then
			google-chrome-stable &
	  	elif [[ -f /usr/bin/chromium ]]; then
			chromium &
		elif [[ -f /usr/bin/midori ]]; then
			midori &
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $music)
		if [[ -f /usr/bin/spotify ]]; then
			spotify &
	    	elif [[ -f /var/lib/flatpak/exports/bin/com.spotify.Client ]]; then
			com.spotify.Client &
		else
			msg "Spotify not found!"
		fi
        ;;
    $settings)
		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
			xfce4-settings-manager &
		else
			msg "No suitable settings manager found!"
		fi
        ;;
    $discord)
	        if [[ -f /var/lib/flatpak/exports/bin/com.discordapp.Discord ]]; then
		    	com.discordapp.Discord &
	    	else
			msg "Discord not found!"
		fi
	;;
    $obs)
	    	if [[ -f /usr/bin/obs ]]; then
	    		obs &
		else
			msg "OBS not found!"
		fi
	;;
    $mail)
	    	if [[ -f /usr/bin/thunderbird ]]; then
			thunderbird &
		else
			msg "Thunderbird not found!"
		fi
	;;
    $keepass)
	    	if [[ -f /usr/bin/keepassxc ]]; then
			keepassxc &
		else
			msg "KeePassXC not installed!"
		fi
	;;
esac
