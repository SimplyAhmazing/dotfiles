# Customize ls
alias ls="ls -G"
alias ll="ls -laph"
alias cover='coverage run --omit=/opt/boxen/pyenv*,tests/*,src/* -m unittest discover && coverage html && open htmlcov/index.html'

# A sorta short version of tree which only shows 2 levels of folders
alias bush='tree -d -L 2 --dirsfirst'
alias tree='tree --dirsfirst'

# Removes cached python files
alias clean='find . -name "*.pyc" -delete && find . -type d -name __pycache__ -delete && find . -name "*.*.orig" -delete'

# Coverage testing
alias cover='coverage run --omit=/opt/boxen/pyenv*,tests/*,src/* -m unittest discover && coverage html && open htmlcov/index.html'

# clean open ports lister
alias op='lsof -i -P | grep -v -e ^Microsoft -e ^Dropbox -e ^BetterTou -e ^HipChat -e ^GitHub -e ^Google -e ^Finder -e ^Office365'

# Open firefox form terminal
alias firefox="open -a '/Applications/Firefox.app'"

# connect ongo to boxen port
alias mong='mongo --port 17017'

# Alias to tell me whats going on w/my env..
alias wigo="python -V; pyenv version"
alias wirgo='printf "\nEnvironment:\n"; wigo; printf "\nRunning Scripts:\n"; running; printf "\nOpen Ports:\n"; op;'

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
source ~/.secret_aliases

[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && . ~/.autojump/etc/profile.d/autojump.bash


# Bash history size limit increase
export HISTCONTROL=erasedups
export HISTSIZE=10000

export TMP_ROOT=$HOME/Projects/data/backends/

alias sys_profile='system_profiler SPUSBDataType'

function set_title() {
    echo -ne "\033]0;$@\007"
}

function get_project() {
    tmp=${PWD#$HOME/Projects/}
    if [ "$tmp" == "$PWD" ]; then
        echo -n ${PWD#$HOME/}
    else
        # With subdirs
        # echo -n $tmp
        # Without subdirs
        echo -n "${tmp%%/*}"
    fi
}
export PROMPT_COMMAND='set_title `get_project`'
