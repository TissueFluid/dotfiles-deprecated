#!/bin/bash

# setup_items=('.vimrc' '.tmux.conf' '.my_shell_scripts' '.zshrc' '.zshrc.local' '.zshrc.pre')

# for item in ${setup_items[@]}; do
#   if [ -e "$HOME/$item" ]; then
#     echo "$HOME/$item exists!"
#   else
#     ln -s "$PWD/$item" "$HOME/$item" && echo "$item setup successfully!"
#   fi
# done

CONF_ROOT="$(dirname $0)"

case "$1" in
  vim)
    CONF_VIM="${CONF_ROOT}/vim/.vimrc"
    [[ -f "$CONF_VIM" ]] && ln -s "$CONF_VIM" ~/.vimrc
    ;;
  zsh)
    CONF_ZSH=("${CONF_ROOT}/zsh/"{".zshrc",".zshrc.pre",".zshrc.local"})
    for item in $CONF_ZSH[@]; do
      [[ -f "$item" ]] && ln -s "$item" "~/$(basename "$item")"
    done
    ;;
  tmux)
    CONF_TMUX="${CONF_ROOT}/tmux/.tmux.conf"
    [[ -f "$CONF_TMUX" ]] && ln -s "$CONF_TMUX" ~/.tmux.conf
    ;;
  emacs)
    CONF_EMACS="${CONF_ROOT}/emacs/init.el"
    [[ ! -d ~/.emacs.d ]] && mkdir -p ~/.emacs.d
    [[ -f "$CONF_EMACS" ]] && ln -s "$CONF_EMACS" ~/.emacs.d/init.el
    ;;
  *)
    echo "$0 [vim | tmux | zsh | emacs]"
esac
