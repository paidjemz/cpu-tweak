#!/usr/bin/bash

# Installer script for CPU Tweak tool
# Made with <3 by PAIDJEMZ

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
path=$(pwd)

# cek root
function cek_root() {
	if [[ "$EUID" -ne 0 ]]; then
		echo -e $red"ERROR.. This script must be run as root. Use sudo" >&2
		exit 1
	fi
}

function install() {
	chmod +x $path/src/cputwk
	cp $path/src/cputwk /usr/sbin
	if [ -e /usr/bin/cputwk ]
	then
		rm /usr/bin/cputwk
	fi
	ln -s /usr/sbin/cputwk /usr/bin/cputwk
}

function success() {
	echo -e $okegreen "[✓] Installation successfull.."
	echo -e $okegreen "to use just type cputwk in your terminal"
	echo ""
	sleep 2.5 && clear
	exit 1
}

function setup() {
	cek_root
	install
	clear && sleep 0.5
	success
}
setup