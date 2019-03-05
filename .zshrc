# Set path
export PATH=$HOME/Code/scripts:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.composer/vendor/bin:$PATH

# Aliases
alias ses="switch-env-sh"
alias ags="ag --silent"
alias du="du -h"
alias pa="php artisan"

# Path oh-my-zsh
export ZSH="/home/lars/.oh-my-zsh"

# Zsh theme
ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# Zsh source directory
source $ZSH/oh-my-zsh.sh
