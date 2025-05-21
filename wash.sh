#!/bin/bash
# Scipte runs updates on System
# Version 1.1
# Written by A Kehlert

sudo apt autoclean  -y
sudo apt autopurge  -y
sudo apt autoremove -y
sleep 5
clear
echo "Cleaned all unessary files"
echo "Have a good day"
