INTERVAL=60
SOUND="$HOME/Music/two faced - linkin park.mp3"

cleanup() {
	echo
	exit 0
}

trap cleanup SIGINT SIGTERM # sigint = interrupt, sigterm = termination

echo "___________"
echo "wifi check"
echo "__________"

while true; do
	STATUS=$(curl -sS -o /dev/null -w "%{http_code}" --max-time 8 https://connectivitycheck.gstatic.com/generate_204 2>/dev/null)
	if [[ "$STATUS" == "204" ]]; then
		echo
		echo "wifi is back!!"
		echo "time: $(date)"

		for i in {1..3}; do
            		if command -v mpv &>/dev/null && [[ -f "$SOUND" ]]; then
                		mpv --no-video --really-quiet "$SOUND"
            		elif command -v pw-play &>/dev/null && [[ -f "$SOUND" ]]; then
                		pw-play "$SOUND"
            		elif command -v paplay &>/dev/null && [[ -f "$SOUND" ]]; then
                		paplay "$SOUND"
            		else
                		echo -e '\a'
                		sleep 1
            		fi
        	done

        	notify-send "wifi works again" 2>/dev/null
		break
    	else
        	echo "[$(date +%H:%M:%S)] no internet."
    	fi

    	sleep "$INTERVAL"

done
