#!/bin/sh

echo "Updating this Mac..."

# Homebrew
brew update
brew upgrade

# Update global Composer packages
/usr/local/bin/composer global update

# Valet restart
valet install