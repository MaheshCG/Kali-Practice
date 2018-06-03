
#!/bin/bash
echo " Resetting the Wifi Adapter: "
airmon-ng stop wlan0mon
sleep 2
echo " Restarting the Network services: "
service NetworkManager restart
sleep 2
echo " "
echo " Done!!! "
exit
