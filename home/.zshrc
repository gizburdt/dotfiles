# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Composer
export COMPOSER_MEMORY_LIMIT=-1

# Set name of the theme to load.
ZSH_THEME="cloud"
ZSH_THEME_CLOUD_PREFIX="~"

# Plugins
plugins=(git)

# Dotfiles
source $DOTFILES/home/functions.zsh
source $DOTFILES/home/aliases.zsh
source $DOTFILES/home/path.zsh

# ZSH
source $ZSH/oh-my-zsh.sh

###############################################################################
# Extra                                                                       #
###############################################################################