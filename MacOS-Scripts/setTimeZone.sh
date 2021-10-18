#!/bin/sh

if [ "$4" != "" ] && [ "$timeZone" == "" ]
then
    timeZone=$4
fi

osx=$(/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion)
maj=$(/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion | awk '{print substr($1,1,2)}')
ref=$(/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion | awk '{print substr($1,4,2)}')

if [ $maj -gt 10 ]
then
	echo
	echo "Check OS string format & OS X systemsetup utility for script compatibility with OS X version $osx"
	echo
	exit
fi

if [ "$timeZone" != "" ]
then
	if [ $ref -lt 5 ]
	then
		echo
		echo "Setting time zone for OS X $osx..."
		/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -settimezone "$timeZone"
		/usr/bin/killall SystemUIServer
		echo "Refreshing the clock in the Menu Bar..."
		echo
	else
		echo
		echo "Setting time zone for OS X $osx..."
		/usr/sbin/systemsetup -settimezone "$timeZone"
		/usr/bin/killall SystemUIServer
		echo "Refreshing the clock in the Menu Bar..."
		echo
	fi
else
	echo
	echo "Error: The timeZone variable is not populated. Press the return key "
	echo "to generate a list of valid time zones. Select & copy the desired "
	echo "time zone from the list & paste into the script on the line reading "
	echo
	echo "	timeZone=\"\" "
	echo
	read -p ""
   /usr/sbin/systemsetup listtimezones
   exit
fi
