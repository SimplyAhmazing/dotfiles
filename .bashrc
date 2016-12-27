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
alias gts="git status"
alias gcm="git commit -am"

alias gpl="git pull"
alias gplom="git pull origin master"
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gphm="git push heroku master"


# hg Alias's
alias hgd="hg diff"
alias hgs="hg status"
alias hpu="hg pull -u"
alias hgb="hg branches"
alias hgl="hg log --template '{node|short} | {date|isodatesec} | {author|user}: {desc|strip|firstline}\\n' | less"
alias hgll="hg log -G -l9 | less"

alias hgco="hg checkout"
alias hgcm="hg commit -m"
alias hgtheirs="hg resolve -t internal:other"
alias hgmines="hg resolve -t internal:local"


# TMUX Alias's
alias tns="tmux new-session -s"
alias tcn="tmux attach -t"
