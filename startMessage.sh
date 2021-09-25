#!/bin/bash
day=$(date +%d)
month=$(date +%m)
year=$(date +%y)
hour=$(date +%H)

todo="$HOME/todo/$day.$month.$year/todo"
msg="$HOME/todo/$day.$month.$year/msg"

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

echo "Oggi è il $day/$month/$year, sono le ore $hour"

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

