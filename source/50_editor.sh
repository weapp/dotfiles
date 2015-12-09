# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='atom'
  export LESSEDIT='atom'
else
  export EDITOR='atom'
fi

export VISUAL="$EDITOR"

alias e=$EDITOR
alias openbash='$EDITOR $DOTFILES/source/'
alias opendot='$EDITOR $DOTFILES/'
alias openup='$EDITOR $DOTFILES/bin/up'
alias cddot='cd $DOTFILES/'
alias openhost='$EDITOR /etc/hosts'
alias reloadbash='source ~/.bash_profile'
