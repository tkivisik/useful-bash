# Bash Scripting
Curator: Taavi Kivisik

Mainly based on:
* [The Bash Guide](http://guide.bash.academy/ "The Bash Guide") - highly recommended.

## Absolute Basics

### Simplest Bash Script

When you save the following code as hello_world.sh
```bash
#!/usr/bin/env bash
echo "Hello World!"
```

### Shebang
The very first line of a script file which starts with a **#!** is called a **shebang** or **hashbang**. It tells the operating system where to find a program (bash) which should be used to run the script file.

Often people also use an absolute path to bash, but that is discouraged due to the different locations where bash could be installed to in different distributions.

```bash
#!/bin/bash
echo "Hello World!"
```

### Running a Bash Script
Type *bash* followed by your script name (*hello_world.sh*)

```bash
$ bash "hello_world.sh"
```

### General Form of a Bash Command
[variable_assignment] **command** [flags] [arguments]

```bash
# Execute a command without arguments
$ ls
# Execute a command with an argument (/bin) - show files in /bin directory
$ ls /bin
# Execute a command with flags (-lht) and an argument (/bin) - list files as a list (-l), show human readable sizes (-h), order by modification time (-t)
$ ls -lht /bin
# Execute a command with specified environmen variables
$ size=5 multiplication_table.sh
```

## Variable Assignment and Use

Variable assignment is done so you type the variable name followed by an equal sign followed by the value. There must not be space between the variable name and other parts, otherwise Bash considers it a command with arguments. You can use a variable by typing a dollar sign ($) immediately before the variable name.  
Use lower-case letters for naming your variables. Variable names written in capital letters are meant for system variables.

```bash
#!/usr/bin/env bash
a=1
b=2
echo "a is $a and b is $b"        # output: 'a is 1 and b is 2'
echo "$a + $b = $[ $a + $b ]"   # output: '1 + 2 = 3'
```

Some special variables:

* **$$** - process id of a current script
* **$USER** - user running this script
* **$HOSTNAME** - hostname of the machine 

## Apostrophes and Quotes

It's better to form a habit of using apostrophes and quotes. They rarely break something, but often save from errors or mistakes. Text inside apostrophes will remain literal even with variables in it. Variables inside quotes will be expanded.

```bash
#!/usr/bin/env bash
literally='will not be expanded'
non_literally='so that variables are expanded'

$ echo 'This will be printed $literally'
# output: This will be printed $literally

$ echo "This will be written $non_literally"
# output: This will be printed so that variables are expanded
```


## Conditionals

### If Statement

Here is a list of logical operators for comparing integers and strings: [use of logical operators](http://tldp.org/LDP/abs/html/comparison-ops.html) 

```bash
#!/usr/bin/env bash
a=1
if [ $a -eq 1 ]; then
    echo "a is equal to 1"
elif [ $a -lt 1 ]; then
    echo "a is less than 1"
else
    echo "a is greater than 1"
fi
```

When a command is finished successfully, it returns the exit code 0. Unsuccessful termination of a program returns another number, which is associated with an error type.

### Parentheses, Brackets, Braces

* **Parentheses** '( )'
    * start a subshell. Current shell's environment is passed on to the child shell.
    * are used to build an array.
* **Double Parentheses** '(( ))' are used for integer arithmetic.
* **Brackets** '[' are a builtin test command.
* **Double Brackets** '[[' are an extension builtin for brackets. It allows for more readable code.
* **Braces** '{ }' are used for
    * grouping commands together in a current shell (need to end with a semicolon).
    * variable substitution
    * brace expansion (e.g. {1..5..2} and {a..j})

```bash
# Execute commands in a subshell
$ parent_time=$( date +%H:%M:%S )
$ echo Parent shell: $parent_time and child shell: $( sleep 1 ; date +%H:%M:%S ; echo Child shell prints this )
Parent shell: 17:15:08 and child shell: 17:15:09 Child shell prints this

# Array initialization
$ array=(1 2 3 4 5)
$ echo "${array[0]}     # Prints the first element
1
```

```bash
$ echo "$(( 1 + 1 ))"
2
```

```bash
$ if [ "1" -lt "2" ] ; then echo 'One is truly less than two' ; fi
One is truly less than two
$ if [ -d "directory_name" ] ; then echo 'That directory exists' ; fi
```

```bash
$ if [[ "1" < "2" ]] ; then echo 'Double brackets allow for the use of the less than symbol' ; fi
Double brackets allow for the use of the less than symbol
```

```bash
# Group commands together in a current shell
$ { echo this ; echo and ; echo that ; }
this
and
that
$ a='great'
$ echo "${a}est"    # without braces, it would look for 'aest' variable
greatest
$ echo {1..10..3} # print every third element starting from 1 until 10
1 4 7 10
$ echo {a..j..2} # print every other character from a to j
a c e g i
```

[[ and (( are commands which take a list of arguments as input, where the last argument must be ]] or )) respectively. If whatever is between [[ and ]] evaluates to true, then the first part after && is run, otherwise the second.

```bash
#!/usr/bin/env bash
a=1
b=2
c=1
echo "a = $a, b = $b, c = $c"
[[ $a = $b ]] && echo "a is equal to b" || echo "a is not equal to b"
# output: a is not equal to b
[[ $a = $c ]] && echo "a is equal to c" || echo "a is not equal to c"
# output: a is equal to c
[[ $b = $c ]] && echo "b is equal to c" || echo "b is not equal to c"
# output: b is not equal to c
```

## Looping

### For Loop

* Bash doesn't require indenting what's inside the loop, but it aids readability.
* Semicolon is the same as a newline. Therefore you could also drop the semicolon and move the do to the next line.

Examples:
```bash
#!/usr/bin/env bash
for i in 1 2 3; do
    echo "$i"
done
```

```bash
#!/usr/bin/env bash
for i in seq{1..5}; do
    echo "$i"
done
```

```bash
#!/usr/bin/env bash
size=10
# for ((initial i ; loop until condition ; after each loop, increase the value of i)); do
for ((i=1 ; i<=$size ; i++)); do
    echo "$i"
done
```


Example which produces a multiplication table:
```bash
#!/usr/bin/env bash
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
#!/usr/bin/env bash
i=1
while [ $i -lt 6 ]; do
    echo "$i"
    i=$[ $i + 1 ]
done
```

## Functions

* **$#** - represents the number of arguments passed to the program (outside of a function) or to the function (inside of a function).
* **$@** - represents the arguments passed to the program (outside of a function) or to the function (inside of a function).
* **$?** - exit status of a most recently ran process.

```bash
#!/usr/bin/env bash
argument_counter () {
    echo "Function argument count: $#"
    echo "Function arguments: $@"
    echo "Function's First argument was: $1"
}

echo "Script is the argument number 0: $0"
echo "Program argument count: $#" 
echo "Program arguments : $@"
# Pass all program arguments to the function, and add the first,
# second and first again argument once again.
argument_counter $@ $1 $2 $1
```

## Example Bash Scripts

See scripting_examples folder for Bash script examples. E.g.
* Random Number Guessing Game
* Multiplication table
* Argument reverser function
