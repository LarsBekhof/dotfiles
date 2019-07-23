# Aliases
source ~/.aliases

# Set path
export PATH=/opt:$PATH
export PATH=$HOME/Code/scripts:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.local/.npm-global/:$PATH

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

# Make ag a little more user friendly and fast
export AG="ag --silent --hidden -p ~/.ignore"
# Make fzf find hidden files
export FZF_DEFAULT_COMMAND="$AG -g ''"
# Default terminal
export TERMINAL=termite
# Default editor
export EDITOR=vim

# Zsh theme
ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  docker
  docker-compose
  web-search
  composer
  vi-mode
  jsontools
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh

[ -f ~/Code/apps/fzf.zsh ] && source ~/Code/apps/fzf.zsh
