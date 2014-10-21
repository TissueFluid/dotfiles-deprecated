#!/bin/bash

setup_items=('.vimrc' '.tmux.conf' '.my_shell_scripts' '.emacs.d')

for item in ${setup_items[@]}; do
  if [ -e "$HOME/$item" ]; then
    echo "$HOME/$item exists!"
  else
    ln -s "$PWD/$item" "$HOME/$item" && echo "$item setup successfully!"
  fi
done
