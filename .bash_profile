source ~/.git-completion.sh
source ~/.git-prompt.sh

PS1='\[\e[1;30m\][\[\e[1;34m\]\u@\H \[\e[1;37m\]\w\[\e[1;30m\]]\n\[\e[0;36m\]$(__git_ps1 " (%s)")\[\e[0;37m\]\$ '
[[ "$PS1" ]] && /usr/local/bin/fortune
