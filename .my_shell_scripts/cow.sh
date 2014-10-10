#!/bin/bash
msg=`/usr/local/bin/fortune -a -s`

# Randomly pick a mode of the cow
modes=("" "-b" "-d" "-g" "-p" "-s" "-t" "-w" "-y")
mode=${modes[$(($RANDOM % 9))]}

# cowsay or cowthink?
cowdos=(/usr/local/bin/cowsay /usr/local/bin/cowthink)
cowdo=${cowdos[$(($RANDOM % 2))]}

speakers=`${cowdo} -l | sed '1d' | xargs`
n_speakers=`echo $speakers | wc -w`

declare -a arr_speakers
IFS=' '
arr_speakers=(${speakers})

speaker=${arr_speakers[$(($RANDOM % $n_speakers))]}

echo "$msg" | $cowdo -n -f $speaker $mode

