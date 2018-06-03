
#!/bin/bash
yad --center --form --width=600 --window-icon=/usr/local/bin/1.png --image=/usr/local/bin/2.png --title="HackEasy" --dialog-sep --text="Choose an Action to Perform: " \
--button=info:info.bash --button-layout=start  \
--button=Reset:reset.bash \
--button=Clear:clear.bash \
--field="Update":fbtn "update.bash" \
--field="MacChanger":fbtn "mac.bash" \
--field="WiFi Jammer":fbtn " gnome-terminal -e jammer.bash" \
--field="WiFi Cracker":fbtn " gnome-terminal -e cracker.bash" \
--field="RogueAP":fbtn " gnome-terminal -e ap.bash" \
--button=gtk-quit:1
