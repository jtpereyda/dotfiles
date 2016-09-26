alias ls='ls --color'
# get local bashrc; used for settings I want only on one computer
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# prompt
export PS1="\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

# Bash auto-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Backup bash history after each command
# From Patrick Bacon https://spin.atomicobject.com/2016/05/28/log-bash-history/
mkdir -p ~/.logs
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
