#!/bin/zsh

# Aliases
source ~/.aliases

# Deno install location
export DENO_INSTALL="/home/lars/.deno"

# Set path
export PATH=$HOME/Code/scripts:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$DENO_INSTALL/bin:$PATH"

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

# Make fzf find hidden files
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file ~/.ignore --no-ignore-vcs"
# Default editor
export EDITOR=nvim

# Zsh theme
ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  docker
  docker-compose
  composer
  vi-mode
  jsontools
  npm
  fzf
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh

open-mr() {
  project=${PWD##*/}
  branch=$(git rev-parse --abbrev-ref HEAD)
  url="https://git.getoaky.com/oaky/${project}/-/merge_requests/new?merge_request%5Bsource_branch%5D=${branch}"
  xdg-open "${url}"
}
