# Useful Command Line For The System
Curator: Taavi Kivisik

## Monitoring the System

### top
top displays processor activity and active tasks of the system. See `man top` for an extensive list of options available (e.g. `k` would allow to kill a process)

Example:
```bash
$ top
```

### pgrep
pgrep is short for process grep, of which grep is short for general regular expression print. pgrep looks up or signals a process based on name or attributes.

```bash
# Show all processes IDs (PIDs) which have python in their attributes
$ pgrep python

# Show all processes IDs (PIDs) of a user (-u) called 'root'
$ pgrep -u root
```

### w
w displays who is logged on and what they are doing.

Example:
```bash
$ w
 22:55:47 up  3:41,  1 user,  load average: 0,13, 0,31, 0,65
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
johndoe  tty8     :0               19:14    3:41m  6:38   0.82s cinnamon-session --session cinnamon
```

**Meaning:**
* current time
* uptime (3h 41m)
* 1 user logged on
* system load average in the last 1, 5, and 15 minutes

### free
free displays the amount of free and used memory in the system - physical and swap memory, buffers and caches used by the kernel.

Example:
```bash
$ free -h
              total        used        free      shared  buff/cache   available
Mem:            11G        6,2G        530M        765M        5,0G        4,2G
Swap:            0B          0B          0B
```

### du
du stands for disk usage and it estimates file space usage of a given directory.

Examples:
```bash
$ du
$ du -h     # -h or --human-readable prints sizes in powers of 1024 (e.g. 1023M)
$ du ~/Documents
```

### df
df stands for disk free. It's similar to du and reports the file system disk usage.

Examples:
```bash
$ df
$ df -h     # -h or --human-readable prints sizes in powers of 1024 (e.g. 1023M)
$ df -H     # -H or --si prints sizes in powers of 1000 (e.g. 1.1G)
```

## Finding Files

### locate

locate allows a quick search of files from a system. It uses a system database of files usually updated once a day automatically. Manual update is done using the 'updatedb' command.

Examples:
```bash
$ locate "somefile.txt"
$ sudo updatedb     # Update the system database of files
```

### find

Examples:
```bash
# Find all files and folders from the current folder and all of its subfolders
$ find .

# Find all files and folders ending with .txt recursively in a folder called
#           Documents of the current user.
$ find ~/Documents -iname "*.txt"

# Find all files and folders inside the specified folder
# CAUTION - adding '-delete' to the end will delete all those files
#         - when using '-delete' keep it at the end, otherwise the command
#           will delete first and only then check for other conditions.
$ find /home/someone/tmp_folder/* #-delete

# Find all files (-type f) in the current directory and one subfolder
#           down (-maxdepth 2)
$ find . -type f -maxdepth 2

```

## System Info, Drives and Devices

### inxi
inxi pretty prints system information. Very useful when reporting issues.

```bash
$ inxi -Fxz
System:
  Host: johndoehome Kernel: 4.15.0-14-generic x86_64 bits: 64 compiler: gcc
  v: 7.3.0 Desktop: Cinnamon 4.0.9 Distro: Linux Mint 19.1 Tessa
  base: Ubuntu 18.04 bionic
Battery:
  ID-1: BAT0 charge: 11.3 Wh condition: 11.4/23.2 Wh (49%)
  model: SANYO 45N1773 status: Unknown
  ID-2: BAT1 charge: 18.2 Wh condition: 69.1/71.3 Wh (97%)
  model: SANYO 45N1777 status: Discharging
CPU:
  Topology: Dual Core model: xxxx bits: 64 type: MT MCP
  arch: xxxx rev: 1 L2 cache: 3072 KiB
  flags: lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx bogomips: 18357
  Speed: 834 MHz min/max: 800/2600 MHz Core speeds (MHz): 1: 798 2: 800
  3: 799 4: 798
Graphics:
  Device-1: xxxx vendor: xxxx
  driver: xxxx v: kernel bus ID: 00:02.0
  Display: x11 server: X.Org 1.19.6 driver: modesetting unloaded: fbdev,vesa
  resolution: 1920x1080~60Hz, 1920x1080~60Hz
  OpenGL: renderer: xxxx v: xxxx
  direct render: Yes
Audio:
  Device-1: Intel Haswell-ULT HD Audio vendor: xxxx driver: snd_hda_intel
  v: kernel bus ID: 00:03.0
  Device-2: Intel 8 Series HD Audio vendor: xxxx driver: snd_hda_intel
  v: kernel bus ID: 00:1b.0
  Sound Server: ALSA v: k4.18.0-14-generic
Network:
  Device-1: xxxx vendor: xxxx driver: xxxx v: xxxx
  port: xxxx bus ID: xxxx
  IF: xxxx state: down mac: <filter>
  Device-2: xxxx driver: xxxx v: kernel port: xxxx
  bus ID: xxxx
  IF: wlp3s0 state: up mac: <filter>
Drives:
  Local Storage: total: xxxx GiB used: xxxx GiB (xxxx%)
  ID-1: /dev/sda vendor: Samsung model: xxxx size: xxxx GiB
Partition:
  xxxx
Sensors:
  System Temperatures: cpu: xxxx C mobo: N/A
  Fan Speeds (RPM): cpu: 0
Info:
  Processes: 250 Uptime: 2h 00m Memory: xxxx GiB used: xxxx GiB (xxxx%)
  Init: systemd runlevel: 5 Compilers: gcc: 7.3.0 Shell: bash v: 4.4.19
  inxi: 3.0.27
```

### fdisk
fdisk allows to display and manipulate the disk partition table.

```bash
# TODO
$ ...
```

## Access

### Virtual Terminals

As the operating systems may or may not (CLI only) have a graphical layer, it's sometimes possible to have the graphical layer crash while the rest of the system remains usable. For example, your graphical desktop environment (e.g. Cinnamon, GNOME, Xfce) is not responsive (screen freeze, mouse freeze, not interactive). You can try to access the system through **virtual terminals**.

```bash
CTRL-ALT-F1
# you are prompted to enter your login name
# then your password
# then you get an access to your system through the command line agian
# fix what needs fixing.

# CTRL-ALT-F2..F6 # Using F1 to F6 would all open a separate virtual terminal

$ shutdown -r now # to restart
# or to return to a virtual terminal running the graphical desktop environment
CTRL-ALT-F7 # Graphical desktop environment runs here on my machine
```

### pkexec

pkexec allows to execute commands as another user (by default as root). E.g. can come handy when `sudo` configuration has been messed up so that `sudo` command is not available.

```bash
$ pkexec echo "You are prompted to enter your root password to print this message"
```

### xdg-open

xdg-open allows to open a folder in a new window, not a terminal. It's handy after going deep into a folder structure in a terminal, and when you would like to continue using a normal window. It can also be used to open files.

```bash
xdg-open .              # open the current working directory
xdg-open some_file.pdf  # open a pdf file
```
