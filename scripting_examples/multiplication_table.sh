#!/usr/bin/env bash
read -p 'Print multiplication table until the number: ' size

for ((i=1 ; i<=$size ; i++)); do
    for ((j=1 ; j<=$size ; j++)); do
        printf "%4s" $(( $i * $j )) 
    done
    echo
done