# source /usr/local/Cellar/rbenv/0.4.0/completions/rbenv.bash
# source ~/.rbenv/completions/rbenv.bash

# source /usr/local/etc/bash_completion.d/git-completion.bash
# source /usr/local/etc/bash_completion.d/git-prompt.sh
# source /usr/local/etc/bash_completion.d/bundler
# source /usr/local/etc/bash_completion.d/gem
# source /usr/local/etc/bash_completion.d/rails
# source /usr/local/etc/bash_completion.d/rake
# source /usr/local/etc/bash_completion.d/ruby
# source /usr/local/etc/bash_completion.d/vagrant
# source /usr/local/etc/bash_completion.d/rabbitmqadmin.bash

# autocompletes
if [ -d /usr/local/etc/bash_completion.d/ ]; then
  for file in /usr/local/etc/bash_completion.d/*; do
      source $file
  done
fi


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring
# wildcards.
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# SSH auto-completion based on entries in known_hosts.
# if [[ -e ~/.ssh/known_hosts ]]; then
#   complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
# fi


complete -W "NSGlobalDomain" defaults
