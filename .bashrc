alias tmux="TERM=screen-256color-bce tmux"

# clear the terminal by typing 'c'
alias c="clear"

#These are my productivity aliases..
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# Git Alias's

alias glt="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gtb="git branch"
alias gcm="git commit"


# hg Alias's
alias hgs="hg status"

alias hgb="hg branch"
alias hgbs="hg branches"
alias hgl="hg log --template '{node|short} | {date|isodatesec} | {author|user}: {desc|strip|firstline}\\n' | less"
alias hgll="hg log -G -l9 | less"

alias hgco="hg checkout"
alias hgcm="hg commit"


# TMUX Alias's
alias tns="tmux new-session -s"
alias tcn="tmux attach -t"

# call .profile file
. ~/.profile


