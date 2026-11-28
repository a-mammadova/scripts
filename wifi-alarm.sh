INTERVAL=60
SOUND="$HOME/Music/too many humans - buckethead.mp3"

cleanup() {
	echo
	exit 0
}

trap cleanup SIGINT SIGTERM # sigint = interrupt, sigterm = termination

while true; do
	STATUS=$(curl -sS -o /dev/null -w "%{http_code}" --max-time 8 https://connectivitycheck.gstatic.com/generate_204 2>/dev/null)
	if [[ "$STATUS" == "204" ]]; then
		echo
		echo "wifi is back!!"
		echo "time: $(date)"

		for i in {1..3}; do
                    pw-play "$SOUND"
        	done

        	notify-send "wifi works again" 2>/dev/null
		break
    	else
        	echo "[$(date +%H:%M:%S)] no internet."
    	fi

    	sleep "$INTERVAL"

done
