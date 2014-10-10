#!/bin/bash

dir_shell_scripts=${HOME}/.my_shell_scripts
cow_or_pony=(cow.sh pony.sh)
bash "${dir_shell_scripts}/${cow_or_pony[$(($RANDOM % 2))]}"
