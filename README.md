# Handy Command Line Tools Notes
Curator: Taavi Kivisik

Remarks:
* Dollar sign indicates a command line. When testing out examples, enter everything after the dollar sign.
* Everything after bars (#) is a comment and doesn't influence the command.

Mainly based on:
* System's manual (man) pages
* Commands' help
* EdX course named Introduction to Linux



## Bash

Bash is a UNIX shell released in 1989. It is a command line interpreter which comes with most Linux distributions, also macOS and Windows 10.

## Getting Help

### apropos
Apropos proposes manual pages related to a specified keyword.

Examples:  
```bash
$ apropos help  
$ apropos password  
```

### man
Man is short for manual. It will open a user manual for that command.

Examples:  
```bash
$ man echo  
$ man apropos  
```

### help, --help or -h
When you already know a command, but can't remember the exact use, you can just use --help flag.

Examples:  
```bash
$ echo --help  
$ ls --help  
```

## First Orientation

### whoami
Displays the user currently using the terminal. Handy to know when working with remote machines.

Example  
```bash
$ whoami  
```

### pwd
pwd - print working directory

Example:  
```bash
$ pwd  
```

### history
Displays the history of commands used in the terminal.

Examples:  
$ history  
$ history | grep *.txt  

### ls
ls is short for list. Displays the list of files and directories in the working directory.

Examples:  
$ ls  
$ ls *.txt  

### env
env is short for environment. Displays the environmental variables.

### echo
Prints all what comes after it to standard out (terminal by default).

Examples:  
$ echo Print this on the screen  
$ echo Current terminal user is $(whoami)  
$ echo Write all this into a file > text.txt  

## First Footprints

### cd
cd is short for change directory. Changes the working directory.

Examples:  
$ cd folder_name      # e.g. from /home/user to /home/user/folder_name  
$ cd ..               # e.g. from /home/user to /home  
$ cd -                # moves you back to where you came from last  
$ cd ~                # move to the home directory of the current user  
$ cd /home            # e.g. from any directory to /home  

### mkdir
mkdir is short for make directory. Creates a new folder in the working directory.

Example:  
$ mkdir folder_name  

### rmdir
rmdir is short for remove directory.

### touch
Update the access and modification times of each FILE to the current time. Often used for creating empty files in the working directory.

Example:  
$ touch existing_file.txt    # modification time changed to current time.  
$ touch new_file_01.txt  
$ touch new_file_01.txt new_file_02.txt  

### rm
rm is short for remove. Removes a file.

Examples:  
$ rm text_file.txt  
$ rm /home/user/text_file.txt  
$ rm /home/user/pointless_folder/*    # Remove all files in the pointless_folder, leave the folder.  
$ rm -r /home/user/pointless_folder   # Recursively remove the folder and its contents  

### cp
cp is short for copy. Copies a file, directory or files and directories.

Examples:
$ cp source_file.txt source_file_copy_name.txt  
$ cp /home/user/files/*.txt /home/user/copied_text_files/  

### mv
mv is short for move. Moves (same as renaming) a file.

Examples:  
look cp examples.  

## Getting an Impression of Files

### head
Prints the top 10 rows of a file to standard out (terminal by default).

Examples:  
$ head notes.txt  
$ head -n 100 notes.txt  

### tail
Prints the bottom 10 rows of a file to standard out (terminal by default).

Examples:  
$ tail notes.txt  
$ tail -n 100 notes.txt  

### less
Displays the file while allowing navigating in it.

Example:  
$ less notes.txt      # 'j' to move down, 'k' to move up, 'q' to quit.  

### cat
cat is short for concatenate. Concatenates files to standard out (terminal by default). Allows also one file as an argument.

Examples:  
$ cat notes.txt  
$ cat notes.txt examples.txt  
$ cat notes.txt examples.txt > two_files_together.txt  
$ cat > notes.txt     # writes everything you write to notes.txt until CTRL+C is pressed  

### tac
tac is cat backwards, which means it concatenates files to standard output (terminal by default) starting from the last line.

Example:  
$ tac zero_to_one.txt > one_to_zero.txt  

### wc
wc is short for word count. Prints newline, word and byte counts.

Examples:  
$ wc notes.txt  
$ wc -l notes.txt     # only prints the line count.  

## Combining Commands

### >
Takes an output from the command on the left and writes it to a file on the right. Overwrites by default.

Example:  
$ echo This text will be written to a file > file.txt  
$ ls > list_of_files.txt  
$ cat > notes.txt     # writes everything you write to notes.txt until CTRL+C is pressed  

### >>
Appends the output from the command on the left to a file 

Examples:  
$ date >> list_of_dates.txt  
$ ls >> list_of_files.txt  
$ cat >> notes.txt     # appends everything you write to notes.txt until CTRL+C is pressed  

### |
| is a piping operator in Bash. Output from the command on the left is given as input to the command on the right.

Examples:  
$ grep ls notes.txt | grep short > lines_with_ls_and_short_in_them.txt  
$ ls -lh | grep .txt      # print access data, human readable sizes and names of txt files  

### <
The file on the right is fed as an input to the command on the left.

Example:  
$ cat > calculations.txt  
1+1  
2+2  
3+3             # Finish writing to calculations.txt by pressing CTRL+C  
$ bc < calculations.txt  
2  
4  
6  

## Manipulating Files

### nano
nano is a lightweight text editor. Opens the file to be edited with nano editor.

Example:  
$ nano file.txt  

### sort
Sorts rows of a file.

Example:  
$ sort file.txt  

### cut
Print selected parts of lines from each file to standard output.

Examples:  
$ cut -d ',' -f 1 table.csv   # prints the first column of a comma separated file  
$ cut -d ';' -f 2-3 table.csv # prints the second and third column of a semicolon separated file  

### paste
Appends the corresponding lines of files. Can be used to add a new column.

Example:  
$ cat table1.csv  
1,2,3  
2,3,4  

$ cat table1.csv  
4  
5  

$ paste -d ',' table1.csv table2.csv  
1,2,3,4  
2,3,4,5  

### split
Splits a source file into smaller files (of 1000 lines each by default, with a prefix of 'x'). Handy when working with very large files.

Example:  
$ split large_file.csv  

### sed
sed is short for steam editor.

Examples:  
$ cat > text.txt  
abcabc  
cbacba  
<CTRL+C>  
$ sed s/a/A/ text.txt       # Replaces the first ocurrance of a with A in every line.  
Abcabc  
cbAcba  
$ sed s/a/A/g text.txt      # Prints the output with a replaced with A  
AbcAbc  
cbAcbA  
$ sed -i s/a/A/g text.txt   # Replaces a with A in the source file itself.  
$ sed s/a/A/g text.txt > new.txt    # Writes the replaced version of the file to new.txt, keeps the original file as was.  

### tr
tr is short for translate. It translates, squeezes, and/or deletes characters from standard input to standard output.

Examples:  
$ cat > text.txt  
abcabc  
cbacba  
<CTRL+C>  
$ cat text.txt | tr a A  
AbcAbc  
cbAcbA  
$ cat text.txt | tr a-z A-Z  
ABCABC  
CBACBA  
$ cat text.txt | tr ab ,  | tr -s ,   
first tr outputs:  
,,c,,c  
c,,c,,  
second tr squeezes the sequential commas to become one, therefore outputs:  
,c,c  
c,c,  

### diff
diff is short for difference and it compares files line by line.

Examples:  
$ diff first_file.txt second_file.txt  

## Handy Shortcuts

### Up-Arrow
Walks through the command history.

Examples:  
* You want to rerun a recently used command with minor edits  
* You used a long filename in a recent command and want to use the same file as input to another command   

### Tab
Tries to autocomplete the command.

Examples:  
$ ls  
first_file.txt  
second_file_txt  
$ rm f<TAB>     # would autocomplete to 'rm first_file.txt'  

### CTRL+ALT+T
Opens a terminal window.

### CTRL+R
Starts an interactive reverse grep (general regular expression print) search of the command line history. After pressing CTRL+R, start typing a fragment of the line you are looking for and see proposals appearing on the command line. Press ENTER to execute it, or Right-Arrow to start editing it.

Examples:  
$ <CTRL+R>g     # finds the latest line from history with g in it  
$ <CTRL+R>cd    # finds the latest line from history with cd in it  

### CTRL+L or clear
CTRL+L or a command 'clear' will clear the terminal of all previous output.

Examples:  
$ clear  
$ <CTRL+L>  
