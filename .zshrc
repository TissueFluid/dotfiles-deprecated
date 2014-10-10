#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

MY_SHELL_SCRIPTS=${HOME}/.my_shell_scripts
source ${MY_SHELL_SCRIPTS}/alias.sh
source ${MY_SHELL_SCRIPTS}/custom.sh
source ${MY_SHELL_SCRIPTS}/functions.sh
# Cowsay
if [[ -n $TMUX ]]; then
  bash ${MY_SHELL_SCRIPTS}/cow.sh
else
  tmux
fi
