export PATH

# # rbenv init.
# PATH="$(path_remove $DOTFILES/vendor/rbenv/bin):$DOTFILES/vendor/rbenv/bin"

# if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
#   eval "$(rbenv init -)"
# fi


if [[ -s "$HOME/.rvm/scripts/rvm" ]]
then
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  function __ruby_ps {
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && gemset="@$gemset"
    local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
    [ "$version" == "1.8.7" ] && version=""
    local full="$version$gemset"
    [ "$full" != "" ] && echo "$full "
  }
else
  if [[ "~/.rbenv/shims" ]]
  then
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH=~/.rbenv/shims:$PATH
    eval "$(rbenv init -)"


    # prompt with ruby version
    # rbenv version | sed -e 's/ .*//'
    __ruby_ps ()
    {
      rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
      printf $rbenv_ruby_version
    }

  else
    __ruby_ps ()
    {
      echo ""
    }


  fi
fi


alias vruby2='echo "2.1.2" > .ruby-version;cd .;touch Gemfile;touch .gitignore'

initruby(){ 
  vruby2;
  echo -e "# -*- coding: utf-8 -*-\nsource 'https://rubygems.org'\n\n#gem 'lotusrb', github: 'lotus/lotus'\ngem 'rspec', group: 'development'" > Gemfile;
  echo -e "--color --format documentation" > .rspec;
  bundle
  curl -s 'https://raw.githubusercontent.com/github/gitignore/master/Ruby.gitignore' > .gitignore
  touch 'README.md'
  touch 'app.rb'
  subl .
}

gemadd(){
  echo -e "\ngem '$1'" >> Gemfile;
  bundle
}


alias be="bundle exec"
alias rk="be rake"
alias rspec="rspec --color --format documentation "

