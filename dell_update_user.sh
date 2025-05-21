#!/bin/bash

#2024-02-23 Rev. 1.1
#grant executing permission to this file. 

source /home/akehlert/scripts/akmenu

file=server_list.txt
while read -r line;
do
#Update disabled root user to ADMIN user
   echo Working on server $line

   echo Show user 2
   	racadm -r $line -u admin -p $tino_pw --nocertwarn get iDRAC.Users.2.UserName
   	sleep 5
   echo Update user 2 to ADMIN
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.2.UserName ADMIN
   	sleep 5
   echo Update password user ADMIN
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.2.Password $stor_pw
   	sleep 5
   echo Assign  role Administrator
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.2.Privilege 0x000001ff
   	sleep 5
   echo Assign administrator permissions for IPMI LAN Privilege
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.2.IpmiLanPrivilege 4
   	sleep 5
   echo Assign administrator permissions for IPMI Serial Privilege
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.2.IpmiSerialPrivilege 4
   	sleep 5
   echo Enable Serial Over LAN
   	racadm -r $line -u admin -p $tino_pw set --nocertwarn iDRAC.Users.2.SolEnable 1
   echo Enable user ADMIN
  	racadm -r $line -u admin -p $tino_pw set --nocertwarn iDRAC.Users.2.Enable 1

#update admin user to MONITOR user
   echo Show user 3
   	racadm -r $line -u admin -p $tino_pw --nocertwarn get iDRAC.Users.3.UserName
   	sleep 5
   echo Update user 3 to MONITOR
   	racadm -r $line -u admin -p $tino_pw --nocertwarn set iDRAC.Users.3.UserName MONITOR
   	sleep 5
   echo Update password user MONITOR
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.Password $monitor
   	sleep 5
   echo Assign role read
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.Privilege 0x00000001
   	sleep 5
   echo Assign user permissions for IPMI LAN Privilege
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.IpmiLanPrivilege 2
   	sleep 5
   echo Assign none permissions for IPMI Serial Privilege
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.IpmiSerialPrivilege 15
   	sleep 5
   echo Disable Serial Over LAN
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.SolEnable 0
	sleep 5
   echo Enable user MONITOR
   	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.Users.3.Enable 1

#Enable IPMI Over LAN
   echo Enable IPMI Over LAN
	racadm -r $line -u $admin -p $stor_pw --nocertwarn set iDRAC.IPMILan.Enable 1

   echo Server $line finished!
 
done < "$file"
