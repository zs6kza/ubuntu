#!/bin/bash
# PBIP AK MOD
# VERSION 1.2
# DATE 2024/05/24

clear
# Comment

          racadm -r ps1101b-141 -u admin -p "$cp_pw" --nocertwarn get iDRAC.NIC | grep MACAddress | awk '{print "rmc0 =", $1}'
          racadm -r ps1101b-141 -u admin -p "$cp_pw" --nocertwarn get iDRAC.NIC | grep SwitchConnection | awk '{print "IPMI =", $1}'
