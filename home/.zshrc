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
source $DOTFILES/home/.functions
source $DOTFILES/home/.aliases
source $DOTFILES/home/.path

# ZSH
source $ZSH/oh-my-zsh.sh

###############################################################################
# Extra                                                                       #
###############################################################################

# >>> yerd PATH >>>
case ":$PATH:" in
  *":/Users/Gijs/Library/Application Support/io.yerd.Yerd/bin:"*) ;;
  *) export PATH="/Users/Gijs/Library/Application Support/io.yerd.Yerd/bin:$PATH" ;;
esac
export PHPRC="/Users/Gijs/Library/Application Support/io.yerd.Yerd/php-cli.ini"
# <<< yerd PATH <<<


# Herd injected PHP binary.
export PATH="/Users/Gijs/Library/Application Support/Herd/bin":$PATH


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/Gijs/Library/Application Support/Herd/config/php/84"


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/Gijs/Library/Application Support/Herd/config/php/85"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/Gijs/Library/Application Support/Herd/config/php/83"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/Gijs/Library/Application Support/Herd/config/php/82"
