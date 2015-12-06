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


export showports="lsof -i -P "
alias sshvagrant="ssh 127.0.0.1 -p 2222  -i ~/.vagrant.d/insecure_private_key -l vagrant"
alias json="python -mjson.tool"
spy () { lsof -i -P +c 0 +M | grep -i "$1"; }
alias grep='grep --color=auto'


alias redis-keys='echo "KEYS *" | redis-cli'


alias rmf="$(which rm)"

alias rubomodify="git status -s | grep -o '[^ \?][^ \?][^ \?]*' | grep rb | xargs rubocop"
alias rubodiff="git status -s | grep -o '[^ \?][^ \?][^ \?]*' | grep rb | xargs rubocop"

alias gc="rubomodify && gc"

alias subl="sublime --add "
ts () {
  DIR=$(dirname "$1");
  mkdir -p "$DIR";
  touch "$1";
  subl "$1";
}

alias githubstatus="curl https://status.github.com/api/status.json -s  |ruby -rjson -e \"puts JSON.parse(STDIN.read)['status']\""

function del(){
  mv $1 /tmp
}

function runhugs(){
  echo "main" | hugs $1 | tail -n +10 | grep -v "Type :? for help" | sed '$d'
}

export DOCKER_HOST='tcp://127.0.0.1:2375'
