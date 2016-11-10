# Dotfiles project




copy ssh key
```
mkdir -p $HOME/.ssh
cp $HOME/?????/ssh/* $HOME/.ssh
chmod 600 $HOME/.ssh/id_rsa
```

[install brew](http://brew.sh/)

```sh
brew tap thoughtbot/formulae
brew install rcm
git clone git@github.com:weapp/dotfiles.git
git clone git@github.com:weapp/xfiles.git
# cp dotfiles/rc/rcrc .rcrc
# rcup
rcup -v -d ~/dotfiles/rc
brew install "git"
brew install "hub"
brew install "wget"
brew install "curl"
brew install "openssl"

# RBENV!
brew install "rbenv"
brew install 'readline'
brew install 'ruby-build' --with-libyaml --with-openssl
brew install 'rbenv-aliases'
brew install 'rbenv-binstubs'
brew install 'rbenv-communal-gems'
brew install 'rbenv-ctags'
brew install 'rbenv-default-gems'
brew install 'rbenv-gem-rehash'
brew install 'rbenv-vars'


# other languages
brew install "n"
# brew install "python"
# brew install "numpy"
brew install "go"
brew install "elixir"
```

## After install

[Monokai for terminal](https://github.com/stephenway/monokai.terminal)
