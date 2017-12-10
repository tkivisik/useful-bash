#!/usr/bin/env bash
reverse_order () {
    arguments=($@)
    argument_count=$#
    printf "%50s" "Passed arguments to the function reversed:  " 
    for ((i=$# ; i>=0 ; i--)); do
        printf "${arguments[i]} " 
    done
    echo
    }

printf "%50s" "Your passed arguments from the command line:  "
printf "%s " $@
echo

reverse_order 1 2 3 $@ 
echo You passed $# arguments to the program
