alias diff='colordiff'
alias make='colormake'
alias rm='trash'
alias vi='__vi'

function __vi()
{
  if [ $(($RANDOM % 2)) -eq 1 ]; then
    vim "$@"
  else
    emacs "$@"
  fi
}
