
#!/bin/bash
echo "-----------------------"
echo "- Updating The System -"
echo "-----------------------"
sudo apt-get update -qq -yy
sudo apt-get upgrade -yy
sudo apt-get dist-upgrade -yy
echo "----------------------"
echo "- Update Complete!!! -"
echo "----------------------"
exit
