#!/usr/bin/env bash

# turn screen on and unlock phone - assumes no password
adb shell input keyevent KEYCODE_POWER
adb shell input touchscreen swipe 930 880 930 380

# start app
adb shell am start -n com.dev47apps.droidcam/com.dev47apps.droidcam.DroidCam
