
#!/bin/bash

yad --center --form --width=300 --title="Mac Spoofer" --text="Choose an Action to Perform: " \
--field="Spoof to a Random MAC Address":fbtn "random.bash" \
--field="Enter The MAC address to spoof Manually":fbtn "manual.bash" \
--field="Recover The MAC address to its TRUE address":fbtn "permanent.bash" \
--button=gtk-quit:1
