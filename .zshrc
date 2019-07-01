# Set path
export PATH=/opt:$PATH
export PATH=$HOME/Code/scripts:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.local/.npm-global/:$PATH

# Aliases
source ~/.aliases

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

AG="ag --silent --hidden -p ~/.ignore"

# Make fzf find hidden files
export FZF_DEFAULT_COMMAND="$AG -g ''"

# Zsh theme
ZSH_THEME="agnoster"

# Default terminal
export TERMINAL=st

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  docker
  web-search
  sudo
  composer
  debian
  docker
  node
  npm
  systemd
  vi-mode
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
