if [[ -s "$HOME/.asdf" ]]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi


export PATH="$HOME/.cargo/bin:/usr/local/opt/curl/bin:$PATH"

export PATH="$HOME/flutter/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"


export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"


export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/manu/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/manu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/manu/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/manu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
