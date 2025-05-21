#!/bin/bash
#DELL SERVER SERIAL NUMBER
# https://www.cyberciti.biz/faq/linux-find-dell-service-tag-command/

for d in system-manufacturer system-product-name system-serial-number bios-release-date bios-version system-product-name chassis-serial-number
do    
  echo "${d^} : " $(sudo dmidecode -s $d)
done
