#!/usr/bin/env bash

# Script to inform the current server statistics.

clear

echo "====== SERVER PERFORMANCE STATS ======"

echo ""

#Total CPU usage
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Total:",100 - $8,"%"}'

echo ""

#Total Memory usage
free -m | awk '/Mem:/ {printf "Total Mem: %dMB | Used: %dMB | Free: %dMB | Using: %.2f%%\n", $2,$3,$4, $3*100/$2}'

echo""

#Total Disk usage
df -h --total | grep 'total' | awk '{printf "Total disk: %s | Used: %s | Free: %s | Using: %s\n", $2,$3,$4,$5}'

echo ""

#Top 5 processes by CPU usage
echo "Top 5 processes by CPU usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo""

echo "TOP 5 processes by memory usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6

echo""

echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"') | Kernel: $(uname -r) | Uptime: $(uptime -p) | Load: $(uptime | awk -F'load average:' '{print $2}') | Users: $(who | wc -l) logged in"

echo ""

echo "======================================"
