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
for file in /usr/local/etc/bash_completion.d/*; do
    source $file
done
