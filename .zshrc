# Aliases
source ~/.aliases

# Set path
export PATH=$HOME/Code/scripts:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=/usr/lib/dart/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

# Make fzf find hidden files
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file ~/.ignore --no-ignore-vcs"
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
  npm
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh
