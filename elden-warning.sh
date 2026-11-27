TITLE="BROOOOO PRIORITIES!!!"

MESSAGE="ur about to enter the lands between! COME BACK TO THE PRIORITIES!!"

# notification
env -u LD_PRELOAD notify-send --urgency=critical --app-name="$TITLE" "$MESSAGE"

# open terminal window
env -u LD_PRELOAD kitty --wait --start-as=maximized zsh -lic '
clear

echo "-----------------------------------------"
echo "FUCKIN PRIORITIES!!!"
echo "-----------------------------------------"
echo
echo "[ ] syncy"
echo "[ ] saa"
echo "[ ] master roadmap"
echo "[ ] stalk tener'\''s notes"
echo "[ ] uni mini projects"
echo

for i in {10..1}; do
	echo -ne "\rlaunching in $i secs..."
	sleep 1
done

echo
echo "remember the goals, tarnished!!!"
echo
sleep 2
'

sleep 3
exec "$@"
