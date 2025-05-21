#!/bin/bash
# Scipte runs updates on System
# Version 1.1
# Written by A Kehlert
	sudo apt update 
	 sudo apt upgrade
	  sudo apt autoclean -y
	   sudo apt autopurge -y
	    sudo apt autoremove -y 
 	  sleep 8

# clear
	sudo apt list --upgradable

echo  "Have a Great Day!"
echo " Today's date is:" ; date
