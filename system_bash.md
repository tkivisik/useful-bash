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
### free
### du
### df

## Finding Files

### locate
Example:  
```bash
$ locate "somefile.txt"
$ sudo updatedb
```

### find

Example:  
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



