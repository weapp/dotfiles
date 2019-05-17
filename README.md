# Dotfiles project

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

# other
brew install "jq"
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
