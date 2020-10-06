#!/usr/bin/env bash

# turn screen on and unlock phone - assumes no password
adb shell input keyevent 82 && adb shell input keyevent 82

# start app on phone
adb shell am start -n com.dev47apps.droidcam/com.dev47apps.droidcam.DroidCam

sleep 2 # wait for app to load

# load mic module
#pacmd load-module module-alsa-source device=hw:Loopback,1,0

# start droidcam on computer
DROIDCAM_PORT=4747
droidcam-cli -a -v adb $DROIDCAM_PORT

