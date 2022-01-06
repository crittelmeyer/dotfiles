#!/usr/bin/env zsh

# Bootstrap a machine by fetching dotfiles and syncing them with user home directory
# Stolen from https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "brew.sh" --exclude "brew-ctf.sh" --exclude "bin/" \
		--exclude "legacy/" --exclude "powerline/" --exclude "tmux-powerline/" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~
	source ~/.zshenv
	source ~/.zshrc
}

read "?This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt
fi

unset doIt
