# Audax-Sound-Selector
Audax-Sound-Selector repository(Bash)


Recently I have been in a quite a hurry but now it is time to return to the wonderful world of Linux once again. Here is one of my recent makings titled as Audax sound selector. The program works within a command line a.k.a. terminal client.  Its sole purpose is to ease the selection of sound cards if you have multiple devices. For example: In the year 2007 I used to have a Soundblaster card along with an integrated Intel sound card inside my computer.

The previous having said, the program is suitable for the situations where you have two sound cards inside your computer. As this program uses Alsa instead of Pulseaudio you do not get to use it to map your Bluetooth devices at this point. When it comes to display driven HDMI audio the chances of getting the sound working seem to depend highly on your kernel variation. When it comes to the kernel the question is whether or not it has the Alsa HDMI support enabled by default. Generally speaking, the HDMI support seems to be turned off at least (in most cases) for Ati display cards since the kernel module has been reported to cause crashes. To use Audax sound selector you should have at least alsa-utils package installed. Without further ado here are some screenshots:

![audax-sound-selector-revb x70132](https://user-images.githubusercontent.com/29865797/28172499-6078d278-67f4-11e7-8cfe-a5bc19c8dee3.png)

As you can see the program reboots Alsa and also tries to reboot Xmms2 daemon if it is installed and running.

You can run the program (for example) by executing sh sound-selector.sh inside a terminal client

OR

by running xterm -e sh sound-selector.sh within a run prompt like Fbrun.

Note. By default this program is supposed to be run as a normal user and within a system, which uses sudo. If you do not use sudo then you might want to tweak the sudo oriented lines which reboot Xmms2 daemon and Alsa. Otherwise the procedure remains the same.

Note. If you use Debian Jessie/Sid your Alsa services might be masked. If this is the case just reboot the computer and your sound settings should load up correctly.

_________________________________
Original post is at:
http://www.techtimejourney.net/audax-sound-selector-program-released/
