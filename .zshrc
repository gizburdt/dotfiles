# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="cloud"
ZSH_THEME_CLOUD_PREFIX="~"

# Plugins
plugins=(git)

# Dotfiles
source $DOTFILES/aliases.zsh
source $DOTFILES/path.zsh

# ZSH
source $ZSH/oh-my-zsh.sh

# Composer
export COMPOSER_MEMORY_LIMIT=-1

###############################################################################
# Injected
###############################################################################

