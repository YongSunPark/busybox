adb wait-for-device
@adb shell su -c setenforce 0; 
@adb shell sleep 1
start cmd /c "adb shell cat /proc/kmsg | grep drop"
start cmd /c "adb shell "while true; do sleep 2;cat /proc/meminfo;done""
::adb shell "echo 524287 > /proc/sys/net/core/rmem_default"
::adb shell "echo 524287 > /proc/sys/net/core/wmem_default"
::adb shell "echo 524287 > /proc/sys/net/core/rmem_max"
::adb shell "echo 524287 > /proc/sys/net/core/wmem_max"
::adb shell "echo 524287 > /proc/sys/net/core/optmem_max"
::adb shell "echo 300000 > /proc/sys/net/core/netdev_max_backlog"
::adb shell "echo 10000000 10000000 10000000 > /proc/sys/net/ipv4/tcp_rmem"
::adb shell "echo 10000000 10000000 10000000 > /proc/sys/net/ipv4/tcp_wmem"
::adb shell "echo 10000000 10000000 10000000 > /proc/sys/net/ipv4/tcp_mem"
::adb shell "echo 10000000 10000000 10000000 > /proc/sys/net/ipv4/udp_mem"
::adb shell "echo 10000000 > /proc/sys/net/ipv4/udp_rmem_min"
::adb shell "echo 10000000 > /proc/sys/net/ipv4/udp_wmem_min"
::adb shell "echo 440220 > /sys/devices/system/cpu/busfreq/curr_freq"
::choice /t 1 /d n > nul
@REM The command script for AP CPU Boost.
::adb shell "echo 4 > /sys/devices/system/cpu/cpufreq/pegasusq/min_cpu_lock"
::adb shell "echo 4 > /sys/devices/system/cpu/cpufreq/pegasusq/max_cpu_lock"
::adb shell "echo 3 > /sys/module/ehci_hcd/parameters/park"
::adb shell "echo 1600000 > /sys/power/cpufreq_min_limit"
::adb shell "echo 1600000 > /sys/power/cpufreq_max_limit"
start cmd /c "adb shell showfreq 1000"
choice /t 1 /d n > nul
adb shell "ifconfig rmnet4 192.167.0.4 netmask 255.255.255.0 up"
start cmd /c "adb shell "iperf -s -u -i 1 -p 9988 -w 512k""
choice /t 2 /d n > nul
adb shell "iperf -c 192.167.0.5 -u -i 1 -b 60M -p 9988 -t 1000"
pause