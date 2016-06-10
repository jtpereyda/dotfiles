alias ls='ls --color'
# get local bashrc; used for settings I want only on one computer
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# prompt
export PS1="\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
