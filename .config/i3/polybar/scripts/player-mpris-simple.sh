#!/bin/sh

truncate_with_ellipsis() {
  message="$1"
  max_length=50
  if [ ${#message} -le $max_length ]; then
    echo "$message"
  else
    echo "${message:0:$max_length}..."
  fi
}

player_status=$(playerctl status 2> /dev/null)
playing_text="$(playerctl metadata artist 2>&1) - $(playerctl metadata title 2>&1)"

if [ "$player_status" = "Playing" ]; then
    truncate_with_ellipsis " $playing_text"

elif [ "$player_status" = "Paused" ]; then
    truncate_with_ellipsis " $playing_text"
elif [[ "$playing_text" == *"No player could handle this command"* ]]; then
  echo " Play Smth - 󰼥 󰐎 󰼦"
else
    echo " Play Smth - 󰼥 󰐎 󰼦"
fi
