# system-information-script
This is a script made in bash for a basic system information.


## How to run ?

* clone the file and put it in a global path, see `echo $PATH`, usually in local `~/.local/bin/`.
* Make it executable `chmod +x system_info.sh` -> also you can change it's name `mv system_info.sh system_info`.
* Run it `system_info`

## Added lately

### 28/2/2026:
* Fixing CPU information, total number of cores, threads, Temperature,...
* Fixing Memory informations.
* Try to make the script works globally as possible on different distros.



### Sample output of the script will be like:

```bash
> $ ./system_info.sh                                                                [±main ✓]
==General info==
Distro name: "Debian GNU/Linux 13 (trixie)"
Current user: (hidden)
Shell: bash
System language: en_US.UTF-8
Terminal: xterm-kitty
Window manager: Hyprland
Session: wayland
Machine running time: 13 hours, 21 minutes

==Kernel info==
Kernel version: Linux, 6.12.69+deb13-amd64
CPU Archi type: x86_64

==Disk==
root filesystem: /dev/nvme1n1p2
Total Disk space: 452G
Disk used space: 132G 31%
Free disk space: 298G

==Memory==
Currently memory used: 5.0Gi
Currently memory available: 10Gi
Swap used: 1.8Mi
Swap free: 15Gi

==CPU==
Model Name: Intel(R) Core(TM) i7-10870H CPU @ 2.20GHz
CPU cores: 8

==GPU==
GPU/s used:
00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05)
01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce RTX 3050 Mobile] (rev a1)
IF you want a more in depth information, install lshw then run `sudo lshw -C display`

==Temperature==
CPU Temp: 20°C

==Networking==
Hostname: (hidden)
IP address (wifi): (hidden)
IP address (ethernet): (hidden)
```

