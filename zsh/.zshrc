#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.aliases-zsh ]] && source ~/.aliases-zsh
[[ -f ~/projects/.project-aliases ]] && source ~/projects/.project-aliases

export PATH=$PATH:${HOME}/.local/bin

# setup keybindings I am used to
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
# typeset -g -A key
#
# key[Home]="${terminfo[khome]}"
# key[End]="${terminfo[kend]}"
# key[Insert]="${terminfo[kich1]}"
# key[Backspace]="${terminfo[kbs]}"
# key[Delete]="${terminfo[kdch1]}"
# key[Up]="${terminfo[kcuu1]}"
# key[Down]="${terminfo[kcud1]}"
# key[Left]="${terminfo[kcub1]}"
# key[Right]="${terminfo[kcuf1]}"
# key[PageUp]="${terminfo[kpp]}"
# key[PageDown]="${terminfo[knp]}"
# key[Shift-Tab]="${terminfo[kcbt]}"
#
# # setup key accordingly
# [[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
# [[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
# [[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
# [[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
# [[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
# [[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
# [[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
# [[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
# [[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
# [[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
# [[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
#
# # Finally, make sure the terminal is in application mode, when zle is
# # active. Only then are the values from $terminfo valid.
# if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#     autoload -Uz add-zle-hook-widget
#     function zle_application_mode_start { echoti smkx }
#     function zle_application_mode_stop { echoti rmkx }
#     add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
#     add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
# fi


# Options
setopt histignorealldups        # Ignore duplicate commands in history file
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
compinit
promptinit
autoload -Uz select-word-style  # Fix some keys inside zsh
select-word-style bash

complete -C '/usr/bin/aws_completer' aws

# Add highlight enabled tab completion with colors
zstyle ':completion:*' menu select
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# eval "$(starship init zsh)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"

export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin


# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || true
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || true
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh || true
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || true

