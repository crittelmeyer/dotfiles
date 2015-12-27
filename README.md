# Dotfiles! All the dotfiles I need.

## oh-my-zsh Alias/Function Cheat Sheet:

### Directories (via .oh-my-zsh/lib/directories.sh)
* d      =  lists recently used directories
* md     =  mkdir
* cd +n	 =  switch to directory number n
* ..     =  cd ..
* ...    =  cd ../..
* /      =  cd /

### git (via .oh-my-zsh/plugins/git/git.plugin.zsh)
* g     =  git
* gst   =  git status
* ga    =  git add
* gb    =  git branch
* gcb   =  git checkout -b
* gcm   =  git checkout master
* gd    =  git diff
* gcp   =  git cherry-pick
* gl    =  git pull
* gp    =  git push
* grbi  =  git rebase -i
* gsta  =  git stash
* gstp  =  git stash pop
* gstd  =  git stash drop
* gstl  =  git stash list

* current_branch      ==> returns name of current branch
* current_repository  ==> returns names of current remotes

### Tmux (via .oh-my-zsh/plugins/tmux/tmux.plugin.zsh)
* ta    =  tmux attach -t
* ts    =  tmux new-session -s
* tl    =  tmux list-sessions
* tksv  =  tmux kill-server
* tkss  =  tmux kill-session -t

### jira (via .oh-my-zsh/plugins/jira/jira.plugin.zsh)
* jira new                  ==>  opens a new issue
* jira dashboard            ==>  opens your JIRA dashboard
* jira reported [username]  ==>  queries for issues reported by a user
* jira assigned [username]  ==>  queries for issues assigned to a user
* jira ABC-123              ==>  opens an existing issue
* jira ABC-123 m            ==>  opens an existing issue for adding a comment

### Thefuck (via .oh-my-zsh/plugins/thefuck/thefuck.plugin.zsh)
* [Esc]x2 = fuck

### zsh_reload (via .oh-my-zsh/plugins/zsh_reload/zsh_reload.plugin.zsh)
* src  ==> sources ~/.zshrc, clears cache

### wakeonlan (via .oh-my-zsh/plugins/wakeonlan/wakeonlan.plugin.zsh)
* wake [machine alias]  ==> uses wakeonlan to wake machine defined in ~/.wakeonlan/[machine alias]

### web_search (via .oh-my-zsh/plugins/web_search/web-search.plugin.zsh)
* google [search terms]  ==> does google search
* github [search terms]  ==> does github search

## vim shortcuts/plugins
* Ctrl-n         ==>  toggle NERDTree
* :5>>           ==>  indent next 5 lines
* :4,8>          ==>  indent lines 4 to 8, inclusive
* Ctrl-t         ==>  insert indent at start of line
* Ctrl-d         ==>  remove indent at start of line
* <Leader>ev     ==>  edit .vimrc
* <Leader>sv     ==>  source .vimrc
* Ctrl-W + Arrow ==> change focused pane

## tmux shortcuts
* See https://gist.github.com/crittelmeyer/5924454be991ed61d6d7

## Other Scripts:

### iTerm 2 img/download utils (via https://www.iterm2.com/images.html)
* imgcat [img path]      ==> displays img in terminal
* imgls $([ls command])  ==> displays file list with img thumbnails for img files
* divider [img path]     ==> displays given img as divider (stretched 100% wide)
