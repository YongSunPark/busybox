#!/bin/sh
adb wait-for-device
adb remount
#adb shell su -c setenforce 0
adb push bash /system/xbin
adb push bashrc /data/.bashrc
adb push bash_profile /data/.bash_profile
adb push busybox-armv7l /system/xbin/busybox
adb push trace-cmd /system/xbin
adb push showfreq /system/xbin
adb push powertop /system/xbin
adb push libncurses.so /data/lib
adb push iperf.sh /system/xbin
adb push iperf /system/xbin
adb push host_logs.sh /system/xbin
adb shell chmod 755 /system/xbin/bash /system/xbin/busybox /system/xbin/trace-cmd /system/xbin/iperf /system/xbin/powertop /system/xbin/showfreq /system/xbin/host_logs.sh 
adb shell su -c /system/xbin/busybox --install -s /system/xbin
#adb shell su -c setenforce 1
adb shell sync
pause
