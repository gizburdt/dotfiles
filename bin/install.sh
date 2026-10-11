#!/usr/bin/env bash

read -p "What is your full name? " fullName
read -p "What is your e-mail address? " email
read -p "What is the name of this computer? " computerName

sudo -v

echo "Setting up this Mac..."

# Install Oh My Zsh
# (don't start zsh or touch .zshrc, it's symlinked below)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no KEEP_ZSHRC=yes /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Symlinks
rm -f $HOME/.zshrc $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/home/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/home/.mackup.cfg $HOME/.mackup.cfg

# Git
touch $HOME/.gitconfig
git config --global user.name "$fullName"
git config --global user.email "$email"
git config --global core.excludesfile $HOME/.dotfiles/home/.global-gitignore
git config --global init.defaultBranch master

# Homebrew dependencies
brew update
brew bundle --file=$HOME/.dotfiles/lib/Brewfile --verbose

# ZSH as default (Homebrew version, must be listed in /etc/shells)
chsh -s "$(brew --prefix)/bin/zsh"

# Global Composer packages
composer global require laravel/installer cpx/cpx

# Create directories
mkdir -p $HOME/Server
mkdir -p $HOME/System
mkdir -p $HOME/Zulu

# Sublime
mkdir -p /usr/local/bin
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# Claude Code
source $HOME/.dotfiles/lib/.claude-code

# Dock
source $HOME/.dotfiles/lib/.dock

# macOS
source $HOME/.dotfiles/lib/.macos $computerName
