# Bash Scripting

## Absolute Basics

### Simplest Bash Script
The very first line of a script file which starts with a **#!** is called a **shebang**. It tells the operating system where to find a program (bash) which should be used to run the script file. 

When you save the following code as hello_world.sh
```bash
#!/bin/bash
echo Hello World!

```

### Running a Bash Script
Type *bash* followed by your script name (*hello_world.sh*)

```bash
$ bash hello_world.sh
```

## Conditionals

```bash
a=1
if [ $a -eq 1 ]; then
    echo a is equal to 1
elif [ $a -lt 1 ]; then
    echo a is less than 1
else
    echo a is greater than 1
fi
```

## Looping

### For Loop for Multiplication Table

```bash
for i in {1..10}; do
    for j in 1 2 3 4 5 6 7 8 9 10
    do
        printf "%4s" $(( $i * $j )) 
    done
    echo
done
```
