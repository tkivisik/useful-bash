# Useful Command Line One-Liners
Curator: Taavi Kivisik

These notes are meant for Bash beginners to:
* get familiar with Bash basics
* see some examples what can be done with one-liners
* know how to continue learning Bash while using it (getting help)
* learn some tricks often unknown to Bash users, like apropos, cat > file.txt, cd -, &, cut, paste

Remarks:
* Dollar sign indicates a command line. When testing out examples, enter everything after the dollar sign.
* Everything after bars (#) is a comment and doesn't influence the command.
* Commands have options to expand their functionality. See them by typing a command name followed by '--help'.
* Run the *init.sh* script to create files and folders to test out the commands in these notes. 

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

### TLDR pages
[TLDR pages](https://tldr.sh/ "TLDR project") are a community effort to simplify the man pages with practical examples. You can install the tldr bash client to get examples of commands on the command line:
* [tldr-bash-client](https://github.com/pepa65/tldr-bash-client "TLDR Bash client")

### www
Search for it online.

## First Orientation

### whoami
whoami is short for *Who am I* and it displays the user currently using the terminal. It's useful to know when working with remote machines.

Example  
```bash
$ whoami  
```

### pwd
pwd is short for print working directory.

Example:  
```bash
$ pwd  
```

### history
Displays the history of commands used in the terminal.

Examples:  
```bash
$ history  
$ history | grep *.txt  
```

### ls
ls is short for list. Displays the list of files and directories in the working directory.

Examples:  
```bash
$ ls  
$ ls *.txt  
```

### env
env is short for environment. Displays the environmental variables.

### echo
Prints all what comes after it to standard out (terminal by default).

Examples:  
```bash
$ echo Print this on the screen  
$ echo Current terminal user is $(whoami)  
$ echo Write all this into a file > text.txt  
```

## First Footprints

### cd
cd is short for change directory. Changes the working directory.

Examples:  
```bash
$ cd folder_name      # e.g. from /home/user to /home/user/folder_name  
$ cd ..               # e.g. from /home/user to /home  
$ cd -                # moves you back to where you came from last  
$ cd ~                # move to the home directory of the current user  
$ cd /home            # e.g. from any directory to /home  
```

### mkdir
mkdir is short for make directory. Creates a new folder in the working directory.

Example:  
```bash
$ mkdir folder_name  
```

### rmdir
rmdir is short for remove directory.

### touch
Update the access and modification times of each FILE to the current time. Often used for creating empty files in the working directory.

Example:  
```bash
$ touch existing_file.txt   # modification time changed to current time.  
$ touch new_file_01.txt  
$ touch new_file_01.txt new_file_02.txt  
```

### rm
rm is short for remove. Removes a file.

Examples:  
```bash
$ rm text_file.txt  
$ rm /home/user/text_file.txt  

# Remove all files in the pointless_folder, leave the folder.  
$ rm /home/user/pointless_folder/*    

# Recursively remove the folder and its contents  
$ rm -r /home/user/pointless_folder   
```

### cp
cp is short for copy. Copies a file, directory or files and directories.

Examples:  
```bash
# Copies to the current directory
$ cp source_file.txt source_file_copy_name.txt

# Copies to another folder  
$ cp source_file.txt some/other/folder/source_file.txt

# Copies only all .txt files to a new location
$ cp /home/user/files/*.txt /home/user/copied_text_files/
```

### mv
mv is short for move. Moves (same as renaming) a file.

Examples:  
```bash
$ mv source_file.txt source_file_renamed.txt  
$ mv source_file.txt some/other/folder/source_file.txt  

# Moves only all .txt files to a new location
$ mv /home/user/files/*.txt /home/user/copied_text_files/
```

## Getting an Impression of Files

### head
Prints the top 10 rows of a file to standard out (terminal by default).

Examples:  
```bash
$ head notes.txt  
$ head -n 100 notes.txt     # Prints the top 100 lines of a file
```

### tail
Prints the bottom 10 rows of a file to standard out (terminal by default).

Examples:  
```bash
$ tail notes.txt

# Prints the bottom 100 lines of a file
$ tail -n 100 notes.txt     

# Follows the changes of a file. Especially useful when looking into log
# files and waiting for a certain process to start or finish.
$ tail -f log_file.log
```

### less
Displays the file while allowing navigating in it.

Example:  
```bash
$ less notes.txt      # 'j' to move down, 'k' to move up, 'q' to quit.  
```

### cat
cat is short for concatenate. Concatenates files to standard out (terminal by default). Allows also one file as an argument.

Examples:  
```bash
$ cat notes.txt  
$ cat notes.txt examples.txt  
```  

Writes the output to a file called two_files_together.txt
```bash
$ cat notes.txt examples.txt > two_files_together.txt
```  

Writes everything you write to notes.txt until CTRL+C is pressed  
```bash
$ cat > notes.txt
```

### tac
tac is cat backwards, which means it concatenates files to standard output (terminal by default) starting from the last line.

Example:  
```bash
$ tac zero_to_one.txt > one_to_zero.txt  
```

### wc
wc is short for word count. Prints newline, word and byte counts.

Examples:  
```bash
$ wc notes.txt  
$ wc -l notes.txt   # only prints the line count.  
$ wc folder/*       # prints word counts for all files in the folder
```

## Combining Commands

### >
Takes an output from the command on the left and writes it to a file on the right. **Overwrites** by default.

Example:  
```bash
$ echo This text will be written to a file > file.txt  
$ ls > list_of_files.txt  
$ cat > notes.txt     # writes everything you write to notes.txt until CTRL+C is pressed  
```

### >>
Appends the output from the command on the left to a file on the right.

Examples:  
```bash
$ date >> list_of_dates.txt  
$ ls >> list_of_files.txt  
$ cat >> notes.txt     # appends everything you write to notes.txt until CTRL+C is pressed  
```

### |
| is a piping operator in Bash. Output from the command on the left is given as input to the command on the right.

Examples:  
From notes.txt find lines with 'ls', then find lines with 'short' in them from those lines, write the result to a file
```bash
$ grep ls notes.txt | grep short > lines_with_ls_and_short_in_them.txt  
```  

Print access data, human readable sizes and names of txt files  
```bash
$ ls -lh | grep .txt
```  

Look recursively for a *'search phrase'* inside all files in the current directory.
```bash
$ grep -r 'search phrase' .
```

### <
The file on the right is fed as an input to the command on the left.

Example:  
```bash
$ cat > calculations.txt  
1+1  
2+2  
3+3  
<CTRL+C>    # Finish writing to calculations.txt by pressing CTRL+C  
$ bc < calculations.txt  
2  
4  
6  
# Same as previous, but writes the results to a file
$ bc < calculations.txt > results.txt
```

### &
Command on the left is run in the background. For example, when you are editing a huge file, you might want to continue with other things in the terminal window. Instead of opening up a new terminal, you can add the ampersand symbol to the end of the command.

Example:
```bash  
$ wc folder/* &             # This command is run in the background
$ jobs                      # View all background jobs  
$ $!                        # View the process ID (PID) of a last started job
```

* [Wait for Background Processes](scripting_examples/waiting_after_background_processes.sh) - Script example of starting several background processes and waiting for a group of them to finish before starting a next group of processes.

## Manipulating Files

### nano
nano is a lightweight text editor. Opens the file to be edited with nano editor.

Example:  
```bash
$ nano file.txt  
```

### sort
Sorts rows of a file.

Example:  
```bash
$ sort file.txt  
$ sort -r file.txt      # Sort in reverse order
```

### cut
Print selected part(s) of lines from each file to standard output. Think of it as splitting the line at a specific delimiter and then selecting desired fields from that list. Default delimiter is TAB and indexing of fields after splitting starts from 1.

Examples:  
```bash  
# prints the first column of a comma separated file  
$ cut -d ',' -f 1 table.csv

# prints the second and third column of a semicolon separated file  
$ cut -d ';' -f 2-3 table.csv
```

### paste
Appends the corresponding lines of files. Can be used to add a new column. Default delimiter is TAB.

Example:  
```bash  
$ cat table1.csv  
1,2,3  
2,3,4  

$ cat table1.csv  
4  
5  

$ paste -d ',' table1.csv table2.csv  
1,2,3,4  
2,3,4,5  
```

### split
Splits a source file into smaller files (of 1000 lines each by default, with a prefix of 'x'). Handy when working with very large files.

Example:  
```bash  
$ split large_file.csv  
```

### sed
sed is short for stream editor. It is often used for replacing elements in a file. There are books written about sed, so learn more about it with 'sed --help' and 'man sed'.

You can use it for replacing patterns as follows:
```bash  
# Replaces the first ocurrance of a pattern with a replacement in every line.
sed s/pattern/replacement/ source_file.txt      
# Replaces all occurrances of a pattern with a replacement. 
sed s/pattern/replacement/g source_file.txt       
```

Examples:  
```bash  
$ cat > source_text.txt  
abcabc  
cbacba  
<CTRL+C>  

# Replaces the first ocurrance of a with A in every line. 
$ sed s/a/A/ source_text.txt   
Abcabc  
cbAcba  

# Print the output with a replaced with A
$ sed s/a/A/g source_text.txt    
AbcAbc  
cbAcbA  

# Replace a with A in the source file itself.  
$ sed -i s/a/A/g source_text.txt   

# Write the replaced version of the file to new.txt, keeps the original file as was.
$ sed s/a/A/g source_text.txt > new.txt      
```

### tr
tr is short for translate. It translates (replaces), squeezes (removes duplicates), and/or deletes characters from standard input to standard output.

Examples:  
```bash  
$ cat > text.txt  
abcabc  
cbacba  
<CTRL+C>  

# a is mapped to A
$ cat text.txt | tr a A         
AbcAbc  
cbAcbA  

# lower case letters are mapped to upper case letters
$ cat text.txt | tr a-z A-Z
ABCABC  
CBACBA  

# elements in the first set [ab] are mapped to the second set [,]
$ cat text.txt | tr ab ,
,,c,,c  
c,,c,,  

# -s squeezes duplicate commas to have one comma.
$ cat text.txt | tr ab ,  | tr -s ,
,c,c  
c,c,  
```

### diff
diff is short for difference and it compares files line by line.

Examples:  
```bash  
$ diff first_file.txt second_file.txt  
```

## Handy Shortcuts

### Up-Arrow
Walks through the command history.

Examples:  
* You want to rerun a recently used command with minor edits  
* You used a long filename in a recent command and want to use the same file as input to another command   

### Tab
Tries to autocomplete the command.

Examples:  
```bash  
$ ls  
first_file.txt  
second_file_txt  
$ rm f<TAB>     # would autocomplete to 'rm first_file.txt'  
```

### CTRL+ALT+T
Opens a terminal window.

### CTRL+R
Starts an interactive reverse grep (general regular expression print) search of the command line history. After pressing CTRL+R, start typing a fragment of the line you are looking for and see proposals appearing on the command line. Press ENTER to execute it, or Right-Arrow to start editing it.

Examples:  
```bash  
$ <CTRL+R>g     # finds the latest line from history with g in it  
$ <CTRL+R>cd    # finds the latest line from history with cd in it  
```

### CTRL+L or clear
CTRL+L or a command 'clear' will clear the terminal of all previous output.

Examples:  
```bash  
$ clear  
$ <CTRL+L>  
```
