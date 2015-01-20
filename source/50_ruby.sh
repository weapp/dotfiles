export PATH

# # rbenv init.
# PATH="$(path_remove $DOTFILES/vendor/rbenv/bin):$DOTFILES/vendor/rbenv/bin"

# if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
#   eval "$(rbenv init -)"
# fi


if [[ -s "$HOME/.rvm/scripts/rvm" ]]
then
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  function __my_rvm_ruby_version {
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && gemset="@$gemset"
    local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
    [ "$version" == "1.8.7" ] && version=""
    local full="$version$gemset"
    [ "$full" != "" ] && echo "$full "
  }
else
  function __my_rvm_ruby_version {
    echo ""
  }
fi

if [[ -s "~/.rbenv/shims" ]]
then
  export PATH=~/.rbenv/shims:$PATH
  eval "$(rbenv init -)"
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

