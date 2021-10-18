#!/bin/sh
# simpler than the time zone script from Jamf Nation, for testing purposes.
systemsetup -settimezone America/Detroit
killall SystemUIServer

