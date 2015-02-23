#!/data/bin/bash
ifconfig rmnet0 192.168.0.1 up
route add 192.168.0.2 rmnet0
sysctl -w net.core.rmem_max=8388608
sysctl -w net.core.wmem_max=8388608
sysctl -w net.core.rmem_default=65536
echo 10000 > /proc/sys/net/core/netdev_max_backlog
echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
iperf -u -w 2M -c 192.168.0.2 -i2 -b 60M