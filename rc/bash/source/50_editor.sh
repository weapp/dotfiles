# Editing

# alias sublime="/Applications/Sublime\ Text.app/Contents//SharedSupport/bin/subl"
# alias sb="/Applications/Sublime\ Text.app/Contents//SharedSupport/bin/subl"
alias subl="sb --add "
ts () {
  DIR=$(dirname "$1");
  mkdir -p "$DIR";
  touch "$1";
  sb "$1";
}


if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='sb -n -w'
  export LESSEDIT='sb -n -w'
else
  export EDITOR='sb -n -w'
fi

export VISUAL="sb -n -w"

export THOR_MERGE="sb -n -w"

alias e=sb
alias openbash='sb $DOTFILES/rc/source/'
alias opendot='sb $DOTFILES/'
alias openup='sb $DOTFILES/rc/bin/up'
alias catup='cat $DOTFILES/rc/bin/up'
alias upls="catup | grep -o '  .*)' | grep -o '[a-z][a-z]*' | cat"
alias cddot='cd $DOTFILES/'
alias openhost='sb /etc/hosts'
alias reloadbash='source ~/.bash_profile'
