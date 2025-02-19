#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.aliases-bash ]] && . ~/.aliases-bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# XDG directives
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# Other exports
export ZELLIJ_CONFIG_DIR="${XDG_CONFIG_HOME}/zellij"

eval "$(starship init bash)"
