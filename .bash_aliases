# c to clear the terminal screen
alias c="clear"
# shorten cd ..
alias ..="cd .."
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

# alacritty.toml edit $ALCONF is set as env. This is used in wsl2 when Alacritty is installed on windows
alias valac="nvim $XDG_CONFIG_HOME/alacritty/alacritty.toml"

# docker
alias d="docker"
alias dils="docker images"
alias dcll="docker container ls -a"
alias dcp="docker container prune"

# kubectl
alias k="kubectl"
alias kgpa="kubectl get pods -A"
alias kgpn="kubectl get pods --namespace $1"
alias kgns="kubectl get namespaces"
