# c to clear the terminal screen
alias c="clear"

# h to view bash history
alias h="history"

# tree to display dir structure
alias tree="tree --dirsfirst -F"

# rm always confirm
alias rm="rm -i"

# neovim and lazygit
alias lg="lazygit"
alias v="nvim"
alias val="nvim ~/.bash_aliases"
alias vrc="nvim ~/.bashrc"
alias sbash=". ~/.bashrc"

# dotfiles repository
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
#---if you are using lazygit, you can replace git with lazygit
