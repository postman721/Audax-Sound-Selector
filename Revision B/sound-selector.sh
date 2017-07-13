echo " ------------------------------------------------------------------------"
echo "
    <Audax sound selector>  Copyright (C) 2015> JJ Posti (techtimejourney.net)
    This program comes with ABSOLUTELY NO WARRANTY; for details see: 
    http://www.gnu.org/copyleft/gpl.html
    This is free software, and you are welcome to redistribute it
    under GPL Version 3, 29 June 2007."

echo " -------------------------------------------------------------------------"
echo "${txtylw}	Welcome to Audax sound selector revision B. ${txtrst}"
echo ".........................................................................."

# Declare variable choice and assign value 4
choice=4
# Print to stdout
echo "${txtgrn}1. Use HDMI card/device"

	echo "${txtgrn}2. Use integrated sound devices ${txtrst}"


	echo "${txtgrn}3. Exit immediatelly ${txtrst}"

echo ".........................................................................."

echo "Enter selection: "
# Loop while the variable choice is equal 4
# sh while loop
while [ $choice -eq 4 ]; do
# read user input
read choice
# sh nested if/else
if [ $choice -eq 1 ] ; then
 
while true
do
echo -n "Please confirm (y or n) :"
read CONFIRM
case $CONFIRM in
y|Y|YES|yes|Yes) break ;;
n|N|no|NO|No)
echo Exiting - you entered $CONFIRM
sleep 3
exit
;;
*) echo Please enter only y or n
esac
done
echo You entered $CONFIRM. Continuing ..

echo "Renaming the old ~/.asoundrc to asoundrc.old"
mv ~/.asoundrc ~/asoundrc.old
echo "\n"
sleep 2

echo "Now seeing all available sound cards and their device numbers."
sleep 2
echo "\n"
echo "Look for the HDMI card number you want to enable. Also note the device number of the card (For example card 0 and device 1)"
echo "\n"
aplay -l | grep card
sleep 5

echo "\n"

echo "Now it is time to setup the HDMI."
echo "\n"
	
echo "What sound card you want to use (Enter a number here. For example 0)? \c"
read CARD
echo "\n"

echo "What device you want to use (Enter a number here. For example 1)? \c"
read DEVICE
echo "\n"

touch ~/.asoundrc

echo "pcm.!pcm {
     type hw
     card $CARD
     device $DEVICE
}
 
pcm.!default {
     type plug
     slave {
           pcm "pcm"
     }
}" >> ~/.asoundrc

echo "\n"

echo "Wrote changes to ~/.asoundrc. Now reseting Xmms2 daemon and restarting Alsa."
sleep 3

sudo killall xmms2d
sudo service alsa-utils stop
sudo alsa force-reload
sudo service alsa-utils start

echo "\n"
echo "Time to exit"

sleep 3

else
        if [ $choice -eq 2 ] ; then

while true
do
echo -n "Please confirm (y or n) :"
read CONFIRM
case $CONFIRM in
y|Y|YES|yes|Yes) break ;;
n|N|no|NO|No)
echo Exiting - you entered $CONFIRM
sleep 3
exit
;;
*) echo Please enter only y or n
esac
done
echo You entered $CONFIRM. Continuing ..

echo "Renaming the old ~/.asoundrc to asoundrc.old"
mv ~/.asoundrc ~/asoundrc.old
echo "\n"
sleep 2

echo "Now seeing all available sound cards and their device numbers."
sleep 2
echo "\n"
echo "Look for the card number you want to enable. (For example card 0)"
echo "\n"
aplay -l | grep card
sleep 5

echo "\n"

echo "Now it is time to set the default sound card."
echo "\n"
	
echo "What sound card you want to use (Enter a number here. For example 0)? \c"
read CARD
echo "\n"

touch ~/.asoundrc
echo "defaults.pcm.card $CARD
defaults.ctl.card $CARD" >> ~/.asoundrc

echo "\n"

echo "Wrote changes to ~/.asoundrc. Now reseting Xmms2 daemon and restarting Alsa."
sleep 3

sudo killall xmms2d
sudo service alsa-utils stop
sudo alsa force-reload
sudo service alsa-utils start

echo "\n"
echo "Time to exit"

sleep 3

exit

else
		if [ $choice -eq 3 ] ; then	
echo  Exiting ... 
exit


                        choice=4
                fi   
        fi
fi
done
exit



