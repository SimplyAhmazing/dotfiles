autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg svn

zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' get-revision      true
zstyle ':vcs_info:*:prompt:*' formats           "%{$FG[005]%}%s%{$reset_color%}%{$FG[007]%}:%{$reset_color%}%{$FG[004]%}%b%{$reset_color%} %m%u%c"
zstyle ':vcs_info:*:prompt:*' actionformats     "%{$FG[005]%}%s%{$reset_color%}%{$FG[007]%}:%{$reset_color%}%{$FG[004]%}%b%{$reset_color%} %m%u%c [%{$FG[013]%}%a%{$reset_color%}] "

zstyle ':vcs_info:*:prompt:*' unstagedstr "%{$FG[226]%}●%{$reset_color%}"
zstyle ':vcs_info:*:prompt:*' stagedstr   "%{$FG[046]%}●%{$reset_color%}"

zstyle ':vcs_info:hg:prompt:*' hgrevformat  "%r" # only show local rev.
zstyle ':vcs_info:hg:prompt:*' branchformat "%b" # only show branch

zstyle ':vcs_info:git*+set-message:prompt:*' hooks check-untracked
zstyle ':vcs_info:hg*+set-message:prompt:*'  hooks check-untracked

function +vi-check-untracked() {
    local has_untracked
    local has_untracked_hg
    local has_untracked_git

    has_untracked=''

    has_untracked_hg=$(hg status 2>/dev/null | grep '^\?')
    if [[ -n ${has_untracked_hg} ]] ; then
        has_untracked="%{$FG[196]%}●%{$reset_color%}"
    fi

    has_untracked_git=$(git status 2>/dev/null | grep 'Untracked')
    if [[ -n ${has_untracked_git} ]] ; then
        has_untracked="%{$FG[196]%}●%{$reset_color%}"
    fi

    hook_com[misc]+=${has_untracked}
}

precmd() {
    vcs_info 'prompt'
}

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='%{$FG[010]%}${PWD/#$HOME/~}%{$reset_color%}'
local current_vcs='%{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}'

local node_version='%{$FG[094]%}‹$(/opt/boxen/nodenv/bin/nodenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
local python_version='%{$FG[028]%}‹$(/opt/boxen/pyenv/bin/pyenv version-name)›%{$reset_color%}'
local ruby_version='%{$FG[088]%}‹$(/opt/boxen/rbenv/bin/rbenv version-name)›%{$reset_color%}'

# Virtual environment info
function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo $FG[226]"($name) "
    fi
}
local virtual_env='$(virtualenv_prompt_info)'

local machine_time='%{$FG[238]%}[%*]%{$reset_color%}'

PROMPT="
${virtual_env}${current_dir} ${current_vcs}
%{$FG[010]%}$ %{$reset_color%}"

RPROMPT="${node_version} ${python_version} ${ruby_version} ${machine_time}"
