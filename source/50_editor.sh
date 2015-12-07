# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='atom'
  export LESSEDIT='atom'
else
  export EDITOR='atom'
fi

export VISUAL="$EDITOR"


alias openbash='$EDITOR ~/.dotfiles/source/'
alias opendot='$EDITOR ~/.dotfiles/'
alias openup='$EDITOR ~/.dotfiles/bin/up'
alias cddot='cd ~/.dotfiles/'
alias openhost='$EDITOR /etc/hosts'
alias reloadbash='source ~/.bash_profile'
