# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='sublime'
  export LESSEDIT='sublime'
else
  export EDITOR='sublime'
fi

export VISUAL="$EDITOR"

alias e=$EDITOR
alias openbash='$EDITOR $DOTFILES/rc/source/'
alias opendot='$EDITOR $DOTFILES/'
alias openup='$EDITOR $DOTFILES/rc/bin/up'
alias catup='cat $DOTFILES/rc/bin/up'
alias upls="catup | grep -o '  .*)' | grep -o '[a-z][a-z]*' | cat"
alias cddot='cd $DOTFILES/'
alias openhost='$EDITOR /etc/hosts'
alias reloadbash='source ~/.bash_profile'
