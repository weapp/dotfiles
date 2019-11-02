# Dotfiles project


### Some configurations
```sh
# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0


# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

```

### esential apps
```sh
curl -s 'https://macapps.link/es/1password-caffeine-chrome-sublime-spotify-telegram-slack-docker' | sh
```

### copy ssh key
```sh
mkdir -p $HOME/.ssh
cp $HOME/?????/ssh/* $HOME/.ssh
chmod 600 $HOME/.ssh/id_rsa
```

### [install brew](http://brew.sh/)
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```sh
brew tap thoughtbot/formulae
brew install rcm
git clone git@github.com:weapp/dotfiles.git
git clone git@github.com:weapp/xfiles.git
rcup -v -d ~/dotfiles/rc
brew install git # for solve problems with autocomplete
```

### gitconfig host dependant configuration
```sh
mkrc -o .gitconfig
mkrc -o .bash_profile
mkrc -o .docker
```

### git configuration
```sh
git config --global user.name "Manuel Albarran"
git config --global user.email "weapp@...."
```


### Sublime Text

Install [Package Control](https://packagecontrol.io/installation).

[Symlink to dotfiles](https://packagecontrol.io/docs/syncing):

```
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/dotfiles/sublime3/User/
```

### more apps
```sh
curl -s 'https://macapps.link/es/firefox-skitch-github-sequelpro-insomnia-unarchiver-skim-cleanmymac-vlc-whatsapp' | sh
```

```sh
brew install "hub"
brew install "wget"
brew install "curl"
brew install "openssl"


brew install "asdf"

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
brew install "python"
brew install "numpy"
brew install "go"
brew install "elixir"

# storages
brew install "redis"
brew install "mysql"
brew install "postgresql"
brew install "elasticsearch"
brew install "mongodb"
brew install "couchdb"
brew install "neo4j"
brew install "sqlite"
brew install "riak"

# other
brew install "jq"
brew install "terminal-notifier"
brew install "graphviz"
brew install "ctags"
brew install "nmap"
```

### gcloud
```sh
brew install google-cloud-sdk

gcloud config configurations list
gcloud auth configure-docker
gcloud components install docker-credential-gcr
gcloud auth login

gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://gcr.io
gcloud config set project astute-task-237715
gcloud config set compute/zone  europe-west1-d
gcloud container clusters get-credentials cluster-1

# gcloud container clusters get-credentials cluster-1 --zone europe-west1-d --project astute-task-237715

kubectl get pods
```

### Minikube


https://github.com/kubernetes/minikube

https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#hyperkit-driver


```sh
brew install hyperkit

curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
&& sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/

brew cask install minikube
minikube config set vm-driver hyperkit
minikube start --vm-driver hyperkit
```

### After install

[Monokai for terminal](https://github.com/stephenway/monokai.terminal)
