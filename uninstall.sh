#!/usr/bin/env bash

# Uninstaller cputweak
# by PAIDJEMZ

# pewarna
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'

# var
path="/usr/sbin/cputwk"
link="/usr/bin/cputwk"

# cek root
function cek_root() {
	if [[ "$EUID" -ne 0 ]]; then
		echo -e $red"ERROR.. This script must be run as root. Use sudo" >&2
		exit 1
	fi
}

function uninstall() {
	echo -e $yellow "Uninstalling cputwk..."
	rm "$link"
	rm "$path"
	sleep 1.5
	echo -e $okegreen "Uninstalling successfull.."
	sleep 1 && clear
	exit 1
}

function begin() {
	cek_root
	uninstall
}
begin