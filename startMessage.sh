#!/bin/bash
day=$(date +%d)
month=$(date +%m)
year=$(date +%y)
hour=$(date +%H)

uptime=$(uptime -p)

todo="$HOME/todo/$day.$month.$year/todo"
msg="$HOME/todo/$day.$month.$year/msg"

color_dir="/opt/shell-color-scripts"
color_script="$color_dir/colorscript.sh"

if [[ ! $# -eq 0 ]]; then
	read -p "Per che giorno? [day.month.year] " data
	dir="$HOME/todo/$data/"
	file="$dir/$1"
	mkdir -p $dir > /dev/null
	touch $file
	echo "Inserire il testo..."
	sleep 1
	nano $file
	echo "Salvato!"
	exit
fi

if [[ $SHOW_COLOR_SCRIPT != "" ]]; then
	
	if [[ ! -d $color_dir ]]; then
		echo "Installo i color scripts..."
		sudo git clone --depth=1 https://gitlab.com/dwt1/shell-color-scripts $color_dir > /dev/null
		sudo chmod 755 $color_script
		echo "color scripts installati :-)"
	fi
	
	if [[ $SHOW_COLOR_SCRIPT == "RANDOM" ]]; then
		bash $color_script -r
	else
		bash $color_script $SHOW_COLOR_SCRIPT
	fi
fi

echo "Oggi è il $day/$month/$year, sono le ore $hour ($uptime)"

if [[ -e $todo ]]; then
	echo "Ci sono delle cose da fare per oggi..."
	cat $todo
	echo 
fi

message="Buon lavoro"

if [[ -e $msg ]]; then
	message="$message e $(cat $msg)"
fi

echo "$message!"

echo

