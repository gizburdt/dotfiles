#!/usr/bin/env bash

echo "Updating this Mac..."

# Homebrew
brew update
brew upgrade
brew cleanup

# Mac App Store
mas upgrade

# Oh My Zsh
"$HOME/.oh-my-zsh/tools/upgrade.sh"

# Update global Composer packages
composer global update

# Update global NPM packages
npm update -g