#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "🍺 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed."
fi

# Ensure Homebrew is in PATH for ARM-based Macs
if [[ $(uname -m) == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update and upgrade
echo "🔄 Updating Homebrew..."
brew update

echo "⏫ Upgrading installed formulae..."
brew upgrade

echo "✅ Homebrew setup complete."

