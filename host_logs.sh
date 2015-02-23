#!/system/bin/bash
/data/bin/killall logcat
cd /data/log/modem_trace
mv *.lst old
su 0 setenforce 0
cat /proc/kmsg > kernel.lst &
logcat -v threadtime -b main -b radio > logcat.lst &
