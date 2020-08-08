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
down="https://raw.githubusercontent.com/paidjemz/cpu-tweak/master/src/cputwk"

# cek root
function cek_root() {
	if [[ "$EUID" -ne 0 ]]; then
		echo -e $red"ERROR.. This script must be run as root. Use sudo" >&2
		exit 1
	fi
}

# cek koneksi
function cek_net() {
	echo -e $cyan "[*] Checking ...."
	ping -c 2 8.8.8.8 > /dev/null 2>&1
	png="$?"

	if [ $png == "0" ]; then
		echo -e $red "[X] Your linux OS is not able to resolve"
		echo -e $red "hostnames over terminal using ping !!"
		echo ""
		echo -e $yellow "Check your internet connection before running this script"
		sleep 1 && exit 1
	fi
}

function depend() {
	which xterm > /dev/null 2>&1
	if [ "$0" -eq "0" ]; then
	echo -e $green "OK"
	sleep 1
	else
	apt update && apt install xterm -y
	echo -e $green "xterm installed"
	sleep 1 && exit 1
}

function install() {
	wget ${down} -O cputwk
	chmod +x cputwk
	mv cputwk /usr/sbin
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
	sleep 1 && clear
	exit 1
}

function setup() {
	cek_root
	cek_net
	install
	clear && sleep 0.5
	success
}
setup
