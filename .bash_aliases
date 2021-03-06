alias dk="docker"
alias dkc="docker-compose"

alias drm='docker stop $(docker ps -a -q)'
alias dstop='docker rm $(docker ps -a -q)'

alias ll='ls -l'
alias lsa='ls -a'
alias rm='rm -i'

alias vimconfig="vim ~/.vimrc"
alias baconfig="vim ~/.bash_aliases"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmkt="tmux kill-session -t"
alias tmns="tmux new -s"

alias tmatcc="tmux -CC attach -t"
alias tmlscc="tmux -CC ls"
alias tmktcc="tmux -CC kill-session -t"
alias tmnscc="tmux -CC new -s"

alias tmtor="tmuxinator"
alias tt="tmuxinator"

alias btton='blueutil -p 1'
alias bttoff='blueutil -p 0'
