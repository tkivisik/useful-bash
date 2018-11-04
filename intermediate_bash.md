# Intermediate Bash

## Globs

```bash
# list all files ending with either pdf or md
ls {*.pdf,*.md}
# match every file starting with i, then a pattern zero or more times
# followed by an m
ls i?(nter)m*
```

## Networking

### nc

Anything TCP, UDP and sockets related. Connects and listens.

```bash
# Look at the manual
man nc
```

**Create a connection between your two terminals**
Terminal 1
```bash
# nc -l <port>
nc -l 8743
```

Terminal 2
```bash
# nc <your ip> <port specified in terminal 1>
nc 123.123.123.123 8743
# Write anything and see it shown in Terminal 1
```

### ss

```bash
# show listening sockets and guessing the use of the socket
ss -tl
# show listening sockets without guessing the use of the socket
ss -tln
```

## Other Helpful Bits

### !$

`!$` brings back the last argument of the previous command.

```bash
# echo prints all arguments (separated by space)
echo 1 2 3  # output: 1 2 3
echo !$     # output: 3

# even though space separates arguments, it's still inserted
echo 1 "2 3"    # output: 1 2 3
echo !$         # output: 2 3

echo 1 2 3"4 5" # output: 1 2 34 5
echo !$         # output: 34 5
```