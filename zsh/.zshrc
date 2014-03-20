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
export PATH="/usr/local/opt/ruby/bin":$PATH

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)


export GREP_OPTIONS="--col=auto"
export ANDROID_HOME=/usr/local/opt/android-sdk

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# alias
alias diff='colordiff'
alias make='colormake'
alias vi='vim'
alias rm='trash'
alias vim='/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim'
alias tar='gtar'
