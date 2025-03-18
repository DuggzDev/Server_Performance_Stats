#!/bin/bash

# Total CPU Usage
top -bn1 | grep "Cpu(s)" | awk '{print "Total CPU Usage: " 100 - $8 "%"}'

#Total Memory Usage, free & used as a percentage
free -m | grep "Mem:" | awk '{print "Total Free memory: " $4/100 "%"}'
free -m | grep "Mem:" | awk '{print "Total Used memory: " $3/100 "%"}'

#Total Disk Usage, free & used as a percentage
df -h --total | grep 'total' | awk '{print "Total Disk Usage: " $5}'
df -h --total | grep 'total' | awk '{print "Total Disk space free: " 100 - $5 "%"}'

#Top 5 process by CPU Usage
printf "\nTop 5 process by CPU Usage:\n"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6 

#Top 5 process by CPU Usage
printf "\nTop 5 process by CPU Memory Usage:\n"
ps -eo pid,comm,%mem --sort=-%mem | head -6 
