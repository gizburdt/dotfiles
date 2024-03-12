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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
 	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/install/Brewfile --verbose

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install global Composer packages
/usr/local/bin/composer global require statamic/cli spatie/visit

# Install global NPM packages
npm install -g aicommits

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

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Dock
source $HOME/.dotfiles/install/.dock

# Set macOS preferences
# We will run this last because this will reload the shell
source $HOME/.dotfiles/install/.macos $computerName
