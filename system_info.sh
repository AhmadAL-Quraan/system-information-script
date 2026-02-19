#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

#General info
echo -e "==General info=="
os_name=$(cat /etc/os-release | grep PRETTY)
echo -e "${RED}Distro name:${RESET} ${os_name#*=}"
echo -e "${RED}Current user:${RESET} $(whoami)"
shell=${SHELL}
echo -e "${RED}Shell:${RESET} ${shell##*/}"
echo -e "${RED}System language:${RESET} ${LANG}"
echo -e "${RED}Terminal:${RESET} ${TERM}"
echo -e "${RED}Window manager:${RESET} ${XDG_CURRENT_DESKTOP}"
echo -e "${RED}Session:${RESET} $XDG_SESSION_TYPE"
upTime=$(uptime -p)
echo -e "${RED}Machine running time:${RESET} ${upTime#* }"

# Kernel version + archi
echo -e "\n==Kernel info=="
echo -e "${RED}Kernel version:${RESET} $(uname -s), $(uname -r)"
echo -e "${RED}CPU Archi type:${RESET} $(uname -m)"

#Disk
echo -e "\n==Disk=="
echo -e "${RED}root filesystem:${RESET} $(df -h / | awk 'NR==2 {print $1}')"
echo -e "${RED}Total Disk space:${RESET} $(df -h / | awk 'NR==2 {print $2}')"
echo -e "${RED}Disk used space:${RESET} $(df -h / | awk 'NR==2 {print $3, $5} ')"
echo -e "${RED}Free disk space:${RESET} $(df -h / | awk 'NR==2 {print $4}')"

#Memory
echo -e "\n==Memory=="
echo -e "${RED}Currently memory used:${RESET} $(free -h | awk 'NR==2 {print $3}')"
echo -e "${RED}Currently memory available:${RESET} $(free -h | awk 'NR==2 {print $7}')"
echo -e "${RED}Swap used:${RESET} $(free -h | awk 'NR==3 {print $3}')"
echo -e "${RED}Swap free:${RESET} $(free -h | awk 'NR==3 {print $4}')"

#CPU info --> /proc/cpuinfo
echo -e "\n==CPU=="
cpuModel=$(cat /proc/cpuinfo | grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2)
echo -e "${RED}Model Name:${RESET} ${cpuModel#* }"
echo -e "${RED}CPU cores:${RESET} $(cat /proc/cpuinfo | grep "cpu cores" | awk 'NR==1{print $4}')"

#GPU info
echo -e "\n==GPU=="
##list pci devices
echo -e "${RED}GPU/s used:${RESET}\n$(lspci | grep -i vga)"
echo -e "${GREEN}IF you want a more in depth information, install lshw then run \`sudo lshw -C display\`${RESET}"

#Temp
echo -e "\n==Temperature=="
echo -e "${RED}CPU Temp:${RESET} $(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | head -1 | awk '{print $1/1000 "°C"}')"

#Networking
echo -e "\n==Networking=="
echo -e "${RED}Hostname:${RESET} $(cat /etc/hostname)"
echo -e "${RED}IP address (wifi):${RESET} $(ip a | grep wlan0 | grep inet | awk '{print $2}')"
echo -e "${RED}IP address (ethernet):${RESET} $(ip a | grep enp | grep inet | awk '{print $2}')"
