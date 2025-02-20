#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.aliases-zsh ]] && . ~/.aliases-zsh

# Options
setopt histignorealldups        # Ignore duplicate commands in history file
autoload -Uz select-word-style  # Fix some keys inside zsh
select-word-style bash

# Add highlight enabled tab completion with colors
zstyle ':completion:*' menu select
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
