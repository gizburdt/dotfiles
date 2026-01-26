#!/bin/sh

echo "Updating this Mac..."

# Homebrew
brew update
brew upgrade
brew cleanup

# Update global Composer packages
composer global update

# Update global NPM packages
npm update -g