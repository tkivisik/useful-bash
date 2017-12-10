#!/usr/bin/env bash
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
