#!/usr/bin/env bash

counter () {
    for ((i=$1 ; i<=$2 ; i++)); do
        echo "$4 $i"
        sleep $3
    done
}

echo 'Four processes will run in the background'
echo 'First two (a1 and a2) will need to be finished before the second two will start'
echo '  group  | count'
echo '==================='
pids=""
counter 1 5 1 "a1       |" &
pids="$pids $!"
counter 6 10 2 "  a2     |      " &
pids="$pids $!"
wait $pids

echo '-------------------'

pids=""
counter 11 15 1 "    b1   |" &
pids="$pids $!"
counter 16 20 2 "      b2 |      " &
pids="$pids $!"
wait $pids
