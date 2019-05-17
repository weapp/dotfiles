# IP addresses
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias curlim="curl -sLD -"

function curlo(){
  curlim $@
  echo ""
}

alias ngrok="ssh -R 80:localhost:9292 ssh.localhost.run"
