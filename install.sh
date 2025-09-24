#!/bin/sh

echo "What is your full name?"
read fullName

echo "What is your e-mail address?"
read email

echo "What is the name of this computer?"
read computerName

# Ask for the administrator password upfront
sudo -v

echo "Setting up this Mac..."

# Install Oh My Zsh
if test ! $(which omz); then
  	/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
 	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

 	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  	eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/install/Brewfile --verbose

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install global Composer packages
/opt/homebrew/bin/composer global require laravel/installer laravel-shift/cli statamic/cli

# Install global NPM packages
npm install -g aicommits
npm install -g @anthropic-ai/claude-code

# Sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# Git
touch $HOME/.gitconfig
git config --global user.name $fullName
git config --global user.email $email
git config --global core.excludesfile $HOME/.dotfiles/.gitignore_global

# Create directories
mkdir $HOME/Server
mkdir $HOME/System
mkdir $HOME/Zulu

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Dock
source $HOME/.dotfiles/install/.dock

# Set macOS preferences
# We will run this last because this will reload the shell
source $HOME/.dotfiles/install/.macos $computerName
