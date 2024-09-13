#!/bin/zsh

# Setup completions
fpath=(~/.zsh-complete $fpath)
autoload -U compinit
compinit

# Set path
export PATH=$HOME/Code/scripts:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

# Make fzf customization
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file ~/.ignore --no-ignore-vcs --no-messages"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --null --sort-files | xargs -0 dirname | sort -u"
export FZF_DEFAULT_OPTS="--preview 'batcat\ --color=always\ {}' --preview-window hidden"


# Default editor
export EDITOR=nvim

# Zsh theme
ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  composer
  vi-mode
  jsontools
  npm
  fzf
  kubectl
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
