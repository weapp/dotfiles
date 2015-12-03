# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='subl'
  export LESSEDIT='subl'
else
  export EDITOR='subl'
fi

export VISUAL="$EDITOR"


alias openbash='subl ~/.dotfiles/source/'
alias opendot='subl ~/.dotfiles/'
alias openup='subl ~/.dotfiles/bin/up'
alias cddot='cd ~/.dotfiles/'
alias openhost='subl /etc/hosts'
alias reloadbash='source ~/.bash_profile'
