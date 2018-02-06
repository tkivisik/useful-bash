# Useful Command Line For The System
Curator: Taavi Kivisik

## Monitoring the System

### top
top displays processor activity and active tasks of the system.

Example:  
```bash
$ top
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

## Drives and Devices

### fdisk
fdisk allows to display and manipulate the disk partition table.
