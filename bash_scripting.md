# Bash Scripting

## Absolute Basics

### Simplest Bash Script

When you save the following code as hello_world.sh
```bash
#!/usr/bin/env bash
echo Hello World!
```

### Shebang
The very first line of a script file which starts with a **#!** is called a **shebang** or **hashbang**. It tells the operating system where to find a program (bash) which should be used to run the script file.

Often people also use an absolute path to bash, but that is discouraged due to the different locations where bash could be installed to in different distributions.

```bash
#!/bin/bash
echo Hello World!
```

### Running a Bash Script
Type *bash* followed by your script name (*hello_world.sh*)

```bash
$ bash hello_world.sh
```

## Variable Assignment and Use

```bash
#!/usr/bin/env bash
a=1
b=2
echo a is $a and b is $b
echo $a \+ $b \= $[ $a + $b ]
```

## Conditionals
Here is a list of logical operators for comparing integers and strings: [use of logical operators](http://tldp.org/LDP/abs/html/comparison-ops.html) 

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

### For Loop

Example which produces a multiplication table

```bash
for i in {1..10}; do
    for j in 1 2 3 4 5 6 7 8 9 10
    do
        printf "%4s" $(( $i * $j )) 
    done
    echo
done
```

### While Loop

```bash
i=1
while [ $i -lt 6 ]; do
    echo $i
    i=$[ $i + 1 ]
done
```

### Random Number Guessing Game
```bash
#!/bin/bash
min=1
max=100
# Generate a random number between min and max.
target=$(( ( RANDOM % $max )  + $min ))
min=$[ $min - 1 ]
max=$[ $max + 1 ]
guesses_made=0
guess=-1

while [ $guess -ne $target ]; do
    echo ==x==x==x== ==x==x==x== ==x==x==x==
    if [[ $guesses_made -ne 0 && $guess -ge $min && $guess -le $max ]]; then
        if [ $target -lt $guess ]; then
            max=$guess
        elif [ $target -gt $guess ]; then
            min=$guess
        fi
    fi
    echo $min \< Target number \< $max
    read -p 'Please enter your guess: ' guess
    guesses_made=$[ $guesses_made + 1 ]
    echo Number of guesses made: $guesses_made
    echo
done
echo
echo Your guess is correct. Target number $target is equal to your guess $guess.
echo Congratulations, you guessed the target number with $guesses_made guesses.
```