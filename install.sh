#!/bin/bash

# If not already installed, install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages listed in the Brewfile
if [[ -f ~/dotfiles/Brewfile ]]; then
  echo "Installing packages from Brewfile..."
  brew bundle --file=~/dotfiles/Brewfile
  brew upgrade
else
  echo "Brewfile not found in ~/dotfiles."
  exit 1
fi
