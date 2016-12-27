# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aa"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python ruby wd)


source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/Users/ahmed/.autojump/bin:bin:/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/rbenv/plugins/ruby-build/bin:/opt/boxen/pyenv/shims:/opt/boxen/pyenv/bin:node_modules/.bin:/opt/boxen/nodenv/shims:/opt/boxen/nodenv/bin:/opt/boxen/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"
#

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# # alias pip="echo 'Use p to install and pc to cache' ; pip \!*"
alias s="python -m SimpleHTTPServer"
alias ss="python -m http.server"  # For python 3
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

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

# Start sml (Standard ML of New Jersey) with keyboard arrow support
alias ssml="socat READLINE EXEC:sml"

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

#Combines mkdir and cd commands..
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# cd with history, http://linuxgazette.net/109/marinov.html
source ~/.bashrc
# source ~/.bash_profile

[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh


# Bash history size limit increase
export HISTCONTROL=erasedups
export HISTSIZE=10000
# shopt -s histappend

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

# Docker settings
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/ahmed/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

alias mde="open -a /Applications/Mou.app"

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
