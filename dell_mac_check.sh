#!/bin/bash
# source /home/akehlert/scripts
# https://www.gooksu.com/2015/04/racadm-quick-dirty-cheatsheet/ 
# rev 1.0
# file=server_mac.txt
# while read -r line:
# do
# check the mac address on new servers
 	Echo Checking MAC Address
     	
sudo racadm --nocertwarn -r ps605a-99 -u ADMIN -p pw_ADMIN getsysinfo