#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Mostly stolen from https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Full list:
# chronic: runs a command quietly unless it fails
# combine: combine the lines in two files using boolean operations
# ifdata: get network interface info without parsing ifconfig output
# ifne: run a program if the standard input is not empty
# isutf8: check if a file or standard input is utf-8
# lckdo: execute a program with a lock held
# mispipe: pipe two commands, returning the exit status of the first
# parallel: run multiple jobs at once
# pee: tee standard input to pipes
# sponge: soak up standard input and write to a file
# ts: timestamp standard input
# vidir: edit a directory in your text editor
# vipe: insert a text editor into a pipe
# zrun: automatically uncompress arguments to command


# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some OS X tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install ctags

# node modules
npm install -g deployd
npm install -g eslint

# Install other useful binaries.
brew install zsh
brew install ack
brew install git
brew install git-lfs
brew install imagemagick
brew install jp2a
brew install lynx
brew install p7zip
brew install pv
brew install rename
brew install speedtest_cli
brew install tree
brew install webkit2png
brew install thefuck
brew install fortune
brew install colordiff
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

# Install tmux/tmuxinator
brew install tmux
brew install reattach-to-user-namespace
gem install tmuxinator

# Remove outdated versions from the cellar.
brew cleanup
