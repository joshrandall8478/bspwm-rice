#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/google-chrome-stable ]]; then
	app="google-chrome-stable"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
google=""
facebook=""
twitter=""
github=""
mail=""
youtube=""
reddit=""
netflix=""
soundcloud=""
hulu=""
plex=""

# Variable passed to rofi
options="$google\n$youtube\n$reddit\n$twitter\n$netflix\n$soundcloud"

chosen="$(echo -e "$options" | $rofi_command -p "Open In:  $app" -dmenu -selected-row 0)"
case $chosen in
    $google)
        $app https://www.google.com &
	;;
    $facebook)
        $app https://www.facebook.com &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://www.gmail.com &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
    $reddit)
	$app https://www.reddit.com/ &
	;;
    $soundcloud)
	$app https://soundcloud.com/ &
	;;
    $netflix)
	$app https://www.netflix.com/ &
	;;
    $hulu)
	$app https://www.hulu.com/ &
	;;
    $plex)
	$app https://app.plex.tv/desktop &
	;;
esac

