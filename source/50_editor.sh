# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='subl'
  export LESSEDIT='subl'
else
  export EDITOR='subl'
fi

export VISUAL="$EDITOR"


alias openbash='subl ~/.dotfiles/source/'
alias openhost='subl /etc/hosts'
alias reloadbash='source ~/.bash_profile'
