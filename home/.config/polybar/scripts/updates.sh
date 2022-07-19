update=`{ checkupdates+aur & flatpak update | cat | sed '$d' | tail -n +2 | sed '/^$/d'; } | wc -l`
op=$((update-2))
echo $op
