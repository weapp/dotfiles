# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GREP_OPTIONS='--color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# Disable ansible cows }:]
export ANSIBLE_NOCOWS=1

alias cls='clear;echo;echo;echo;echo;echo;echo;echo;echo;echo;clear'
alias cls='ruby -e "puts [nil]*100"'


alias server='python -m SimpleHTTPServer 8000'
alias rserver='ruby -run -e httpd . -p 8000'


alias showports="lsof -i -P "
alias lsports="lsof -i -P "
alias sshvagrant="ssh 127.0.0.1 -p 2222  -i ~/.vagrant.d/insecure_private_key -l vagrant"
alias json="python -mjson.tool"
alias xml="xmllint --format -"
alias urldecode='python -c "import sys, urllib as ul; \
    print ul.unquote_plus(sys.argv[1])"'
alias pastexml="pbpaste | xmllint --format -"
spy () { lsof -i -P +c 0 +M | grep -i "$1"; }
alias grep='grep --color=auto'



alias redis-keys='echo "KEYS *" | redis-cli'


alias rmf="$(which rm)"

alias rubomodify="git status -s | grep -o '[^ \?][^ \?][^ \?]*' | grep rb | xargs rubocop"
alias rubodiff="git status -s | grep -o '[^ \?][^ \?][^ \?]*' | grep rb | xargs rubocop"


alias rubobranch='git diff master --numstat | cut -f 3 | grep "\.rb$" | xargs ls 2>/dev/null | xargs rubocop -a'



alias rbcm="git diff --name-only | grep '.rb' | xargs ls 2>/dev/null | xargs rubocop"
alias rbcc="git diff --cached --name-only | grep '.rb' | xargs ls 2>/dev/null | xargs rubocop"
alias rspecm="git diff --name-only | grep '.rb' | xargs ls 2>/dev/null | xargs bundle exec rspec"
alias rspecc="git diff --cached --name-only | grep '.rb' | xargs ls 2>/dev/null | xargs bundle exec rspec"


# alias tr='RBENV_VERSION=2.3.0 travis'


alias gc="rubomodify && gc"

alias myip="curl http://whatismyip.akamai.com"
alias myip6="curl http://ipv6.whatismyip.akamai.com"
alias githubstatus="curl https://status.github.com/api/status.json -s  |ruby -rjson -e \"puts JSON.parse(STDIN.read)['status']\""
alias tarall="find * -maxdepth 0 -type d -exec tar czf {}.tar.gz {} \;"

function del(){
  mv $1 /tmp
}

function runhugs(){
  echo "main" | hugs $1 | tail -n +10 | grep -v "Type :? for help" | sed '$d'
}

alias path='echo $PATH | tr -s ":" "\n"'

alias mkdot="mkrc -d $HOME/dotfiles/rc"

# alias now='date -u +"%Y%m%d%H%M%S"'
alias now='date +%s'

function ipconfig(){
  ifconfig | egrep "((127\.\d+\.\d+\.\d+)|(10\.\d+\.\d+\.\d+)|(172\.1[6-9]\.\d+\.\d+)|(172\.2[0-9]\.\d+\.\d+)|(172\.3[0-1]\.\d+\.\d+)|(192\.168\.\d+\.\d+))|$"
}

# export DOCKER_HOST='tcp://127.0.0.1:2375'


# alias deploy='echo "
# 0️⃣  cd ~/projects/cab/ && git checkout master && git pull && git push origin master:production

# 1️⃣  ssh eu-dev

# 2️⃣  cd ~/workspace/cabify_server && git checkout production && git pull && bundle

# 3️⃣  cap production deploy
# "'

alias deploy='echo "
0️⃣  git checkout master; git pull

1️⃣  git tag -a "XXX" -m "XXX"

2️⃣  push --follow-tags

3️⃣  git checkout develop; git pull

4️⃣  git merge master --no-ff

5️⃣  git commit -m \"update with master\"

6️⃣  git push

7️⃣  open \"https://console.cloud.google.com/cloud-build/builds?authuser=1&project=janus-156310\"
"'

function kc(){
  if [[ "$1" ]]; then
    kubectl config use-context "$1"
  else
    kubectl config get-contexts
  fi
}

export GOPATH="/Users/manu/projects/go"
# PATH=$PATH:$GOPATH/bin
# export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

k () { cd ~/.k; eval "$(ruby k.rb "$@")"; }

function newtab { osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e "tell application \"Terminal\" to do script \"$*\" in selected tab of the front window"; }







drmi () {
  docker images | grep "$1" | tr -s " " | cut -d ' ' -f 2 | xargs -I {} docker rmi "$1:{}"
}
