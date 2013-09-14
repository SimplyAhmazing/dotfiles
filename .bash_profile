# Customize ls
alias ls="ls -G"
alias lsl="ls -laph"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Customize the bash prompt
export PS1='\[\033[0;35m\]\u\[\033[0;33m\] \w\[\033[00m\]: '

#Combines mkdir and cd commands..
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# cd with history, http://linuxgazette.net/109/marinov.html
source ~/bash/acd_func.sh
source ~/.bashrc

[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && . ~/.autojump/etc/profile.d/autojump.bash


# Bash history size limit increase
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
