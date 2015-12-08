#!/bin/sh
export DOTFILES=$HOME/dotfiles

# installing brew
which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo xcodebuild -license accept
brew doctor
brew update

brew tap "thoughtbot/formulae"
brew install "caskroom/cask/brew-cask"
brew cask install "dropbox"
brew install "rcm"
brew install "git"
brew install "hub"
brew install "wget"
brew install "curl"
brew install "openssl"
brew cask install "atom"
brew cask install "telegram"

if [ -d /Users/manu/.ssh ]
  mkdir -p $HOME/.ssh
  cp $HOME/Dropbox/ssh/* $HOME/.ssh
  chmod 600 $HOME/.ssh/id_rsa
fi

if [ -d $DOTFILES ]
  git clone git@github.com:weapp/dotfiles.git $DOTFILES
fi
lsrc -d ~/dotfiles/rc
rcup -v -d ~/dotfiles/rc
