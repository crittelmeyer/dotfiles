# Dotfiles! All the dotfiles I need.

## Installation
Highly customized instructions for setting up a new mac to my liking

* Install Chrome               => https://www.google.com/chrome/browser/desktop/
* Install Spotify              => https://www.spotify.com/us/download/mac/
* Install Postman              => https://www.getpostman.com/
* Install Slack                => https://slack.com/downloads
* Install Sublime Text         => https://www.sublimetext.com/download
* Install Atom                 => https://atom.io/
* Install Dropbox              => https://www.dropbox.com/en_GB/downloading?os=mac
* Install Gyazo and Gyazo GIF  => https://gyazo.com/download
* Install iTerm 2              => https://www.iterm2.com/4
* Install XCode                => https://itunes.apple.com/us/app/xcode/id497799835?mt=12
* Install Homebrew             => http://brew.sh/
* Install self-hosted tools    => https://github.com/crittelmeyer/dotfiles/tree/master/bin

* Create ~/Repos directory
* Pull this dotfiles repo
* Run [brew.sh](https://github.com/crittelmeyer/dotfiles/blob/master/brew.sh) to install more common tools
* Run [brew-ctf.sh](https://github.com/crittelmeyer/dotfiles/blob/master/brew-ctf.sh) to install pentest/ctf tools
* TODO: do we need to update/install zsh 5.2 here? Or did something in brew.sh do that for us?
* TODO: does the bootstrap script properly ignore unneeded files?
* Run [bootstrap.sh](https://github.com/crittelmeyer/dotfiles/blob/master/bootstrap.sh) to sync dotfiles with home dir

* Change system keyboard settings and update Caps Lock modifier key to map to Ctrl
* TODO: Instructions for updating iTerm prefs

## oh-my-zsh Alias/Function Cheat Sheet:

### Directories (via .oh-my-zsh/lib/directories.sh)
* d      =  lists recently used directories
* md     =  mkdir
* cd +n	 =  switch to directory number n
* ..     =  cd ..
* ...    =  cd ../..
* /      =  cd /

### Thefuck (via .oh-my-zsh/plugins/thefuck/thefuck.plugin.zsh)
* [Esc]x2 = fuck = try to fix last command

### zsh_reload (via .oh-my-zsh/plugins/zsh_reload/zsh_reload.plugin.zsh)
* src  ==> sources ~/.zshrc, clears cache

### wakeonlan (via .oh-my-zsh/plugins/wakeonlan/wakeonlan.plugin.zsh)
* wake [machine alias]  ==> uses wakeonlan to wake machine defined in ~/.wakeonlan/[machine alias]

### web_search (via .oh-my-zsh/plugins/web_search/web-search.plugin.zsh)
* google [search terms]  ==> does google search
* github [search terms]  ==> does github search

## git cheatsheet/shortcuts
* See https://gist.github.com/crittelmeyer/140288b14a182706252b

## vim cheatsheet/shortcuts/plugins
* See https://gist.github.com/crittelmeyer/206caffcb860e2ef4052

## tmux/tmuxinator cheatsheet/shortcuts
* See https://gist.github.com/crittelmeyer/5924454be991ed61d6d7

## jira cheatsheet
* See https://gist.github.com/crittelmeyer/5e1c43f058c03940f569715d99639f47

## rvm cheatsheet
https://gist.github.com/crittelmeyer/78cf2c167c963d279ae8

## linux tools
https://gist.github.com/crittelmeyer/6acae5aeec3e1ec210ce

## rails cheatsheet/shortcuts
* See https://gist.github.com/crittelmeyer/a91a911e8886fc27daf6

## node/npm cheatsheet/shortcuts
https://gist.github.com/crittelmeyer/e3e8f58f5808fca8ba2aeda1509a877a

## docker/docker-compose/docker-machine cheatsheet/shortcuts
TODO

## vagrant cheatsheet/shortcuts
TODO

## puppet cheatsheet/shortcuts
TODO
