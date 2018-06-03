
#!/bin/bash
echo " "
echo " Available List Of Interfaces: "
echo " "
ls /sys/class/net
echo " "
intf=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The Interface to Restore : " --entry )
until [ "$intf" == eth0 ] || [ "$intf" == wlan0 ]
do
intf=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid Interface to Spoof : " --entry )
done
echo " Stoping the Network Service: "
echo " "
service NetworkManager stop
sleep 2
echo " Taking Down The Interface: "
echo " "
ifconfig "$intf" down
sleep 2
echo " Changing the MAC address to its TRUE address: "
echo " "
macchanger -p "$intf"
sleep 2
echo " "
echo " Bringing the Interface back up : "
echo " "
sleep 2
ifconfig "$intf" up
echo " Restoring the Service: "
echo " "
sleep 2
service NetworkManager start
echo " Done!!! "
echo " "
exit
