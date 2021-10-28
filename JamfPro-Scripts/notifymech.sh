#!/bin/bash

#Variable List:
JAMFBIN="/usr/local/bin/jamf"

# Notify Mechanism:
# Change the default text displayed to the user
echo "Command: MainTitle: Welcome to AnyCo!" >> /var/tmp/depnotify.log
echo "Command: MainText: Welcome to your new Mac.\\nSit tight as we do some basic setup to get you ready for success.\\nYou can see the status of the setup on the progress bar below." >> /var/tmp/depnotify.log

# Update the user of the status of the onboarding
echo "Status: Installing Jamf" >> /var/tmp/depnotify.log

# Check the path of the Jamf client binary.  If not present yet, wait 2 seconds and
# check again.
until [ -f $JAMFBIN ]
do
        echo "Status: Waiting on Jamf" >> /var/tmp/depnotify.log 
        sleep 2
done

# Notify the user that we will let Jamf Pro take over at this point
echo "Status: Passing command and control to Jamf Pro" >> /var/tmp/depnotify.log

# Call a custom trigger named "JamfConnectLoginInstalled" to start the onboarding 
$JAMFBIN policy -event JamfConnectLoginInstalled