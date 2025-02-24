# XDG Base directory specification
export XDG_CONFIG_HOME="$HOME/.config"                  # Config files
export XDG_CACHE_HOME="$HOME/.cache"                    # Cache files
export XDG_DATA_HOME="$HOME/.local/share"               # Application data
export XDG_STATE_HOME="$HOME/.local/state"              # Logs and state files

export ZELLIJ_CONFIG_DIR="${XDG_CONFIG_HOME}/zellij"    # Set Zellij home for config


# Locale settings
export LANG="en_US.UTF-8" # Sets default locale for all categories
export LC_ALL="en_US.UTF-8" # Overrides all other locale settings
export LC_CTYPE="en_US.UTF-8" # Controls character classification and case conversion

# Use Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Setup wsl browser support
export BROWSER="xdg-open"
# Add /usr/local/bin to the beginning of the PATH environment variable.
# This ensures that executables in /usr/local/bin are found before other directories in the PATH.
export PATH="/usr/local/bin:$PATH"
