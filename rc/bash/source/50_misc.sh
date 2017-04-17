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

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

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


alias tr='RBENV_VERSION=2.3.0 travis'


alias gc="rubomodify && gc"

alias subl="sublime --add "
ts () {
  DIR=$(dirname "$1");
  mkdir -p "$DIR";
  touch "$1";
  $EDITOR "$1";
}

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

export DOCKER_HOST='tcp://127.0.0.1:2375'




export GOPATH="/Users/manu/projects/go"
# PATH=$PATH:$GOPATH/bin
# export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

k () { cd ~/.k; eval "$(ruby k.rb "$@")"; }

