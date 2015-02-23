#!/bin/sh
adb shell mkdir /system/etc/bash
adb push bash_history /system/etc/bash
adb push bash_profile /system/etc/bash
adb push bashrc /system/etc/bash
adb push profile /system/etc/bash
adb push bash /system/bin
