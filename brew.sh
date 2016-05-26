#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Mostly stolen from https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

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
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install ctags

# Install development tools.
brew install python
brew install ghc cabal-install
brew install phantomjs
brew install node

# Install rvm
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# ruby versions
rvm get stable --auto-dotfiles
source /usr/local/rvm/scripts/rvm
rvm install 2.0.0-p645
rvm install 2.3.0
rvm use 2.3.0

# gems
gem install bundler
gem install rails
gem install pry
gem install byebug
gem install unicorn
gem install rspec
gem install guard
gem install teaspoon-mocha
gem install rubocop
gem install scss_lint
gem install haml_lint

# pip modules
pip install flake8
pip install git+git://github.com/Lokaltog/powerline

# node modules
npm install -g bower
npm install -g cypress-cli
npm install -g redux-cli
npm install -g deployd
npm install -g eslint
npm install -g mocha

# Install other useful binaries.
brew install zsh
brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
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

# Install tmux/tmuxinator
brew install tmux
brew install reattach-to-user-namespace
gem install tmuxinator

# Remove outdated versions from the cellar.
brew cleanup
