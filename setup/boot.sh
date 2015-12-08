#!/bin/sh

set -o xtrace

export DOTFILES=$HOME/dotfiles

# installing brew
if ! ( which brew > /dev/null ); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo xcodebuild -license accept
fi

brew doctor
brew update

function missing_brew_package () {
  for i in "$@"; do
    [ -z "$(brew ls --versions $i)" ] && return 0
  done
}

if missing_brew_package rcm; then
  brew tap "thoughtbot/formulae"
  brew install "rcm"
fi

if missing_brew_package dropbox atom telegram; then
  brew install "caskroom/cask/brew-cask"
  brew cask install "dropbox"
  brew cask install "atom"
  brew cask install "telegram"
fi

if missing_brew_package git hub wget curl openssl; then
  brew install "git"
  brew install "hub"
  brew install "wget"
  brew install "curl"
  brew install "openssl"
fi

if [ ! -d /Users/manu/.ssh ]; then
  mkdir -p $HOME/.ssh
  cp $HOME/Dropbox/ssh/* $HOME/.ssh
  chmod 600 $HOME/.ssh/id_rsa
fi

if [ ! -d $DOTFILES ]; then
  git clone git@github.com:weapp/dotfiles.git $DOTFILES
fi

# lsrc -d ~/dotfiles/rc
rcup -v -d ~/dotfiles/rc
rcup -v # linking Dropbox rcs

brew bundle
