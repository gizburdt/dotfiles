#!/bin/sh

read -p "What is your full name? " fullName
read -p "What is your e-mail address? " email
read -p "What is the name of this computer? " computerName

sudo -v

echo "Setting up this Mac..."

# Install Oh My Zsh
if test ! $(which omz); then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Install Homebrew
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Symlinks
rm -f $HOME/.zshrc $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/home/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/home.mackup.cfg $HOME/.mackup.cfg

# ZSH as default
chsh -s $(which zsh)

# Git
touch $HOME/.gitconfig
git config --global user.name $fullName
git config --global user.email $email
git config --global core.excludesfile $HOME/.dotfiles/home/.global-gitignore
git config --global init.defaultBranch master

# Update Homebrew
brew update

# Install Homebrew dependencies
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/config/Brewfile --verbose

# Install global Composer packages
composer global require laravel/installer statamic/cli

# Sublime
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# Create directories
mkdir $HOME/Server
mkdir $HOME/System
mkdir $HOME/Zulu

# Dock
source $HOME/.dotfiles/config/.dock

# Set macOS preferences
# We will run this last because this will reload the shell
source $HOME/.dotfiles/config/.macos $computerName
