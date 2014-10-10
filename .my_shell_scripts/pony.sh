#!/bin/bash
msg=`/usr/local/bin/fortune -a -s`

ponydos=(/usr/local/bin/ponysay /usr/local/bin/ponythink)
ponydo=${ponydos[$(($RANDOM % 2))]}

echo "$msg" | $ponydo
