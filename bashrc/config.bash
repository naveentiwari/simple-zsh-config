export CVAR_USER="manmitta"
export CVAR_MYHOME="/Users/manmitta/workspace"
export CVAR_SYSTEM_HOME="/Users/manmitta/workspace"

alias mkcd='_(){ mkdir -p $1; cd $1; }; _'
alias lsdir='find . -maxdepth 1 -type d | sort | sed "s/^..//"'
alias lsfiles='_(){ find . -maxdepth 1 -type f -name "*$1*" | sed "s/^..//" | sort; }; _'
alias killUserprocess="pkill -u $CVAR_USER"

alias processMem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias processCpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'

# moving up the directories
alias bk='_N_MoveUP'
alias ..='_N_MoveUP 1'
alias ...='_N_MoveUP 2'
alias .1='_N_MoveUP 1'
alias .2='_N_MoveUP 2'
alias .3='_N_MoveUP 3'
alias .4='_N_MoveUP 4'
alias .5='_N_MoveUP 5'
alias .6='_N_MoveUP 6'
alias .7='_N_MoveUP 7'

function _N_MoveUP () {
for (( i = 0; i < $1; i++ ))
do
    cd ..
done
}

# general utilities
alias ll='ls -l'

alias gl="git log --date-order --graph --pretty=format:'%C(bold yellow)%h%Creset %C(bold blue)[%an | %cI] %C(yellow)%d%Creset %s %Creset' --abbrev-commit --date=short"

function set_PS1 () {
    # always the first thing in this function
    # else the return status of last execution is lost
    local RET=$? # set return value of last command

    local NONE="\[\033[0m\]" # unsets color to term's fg color

    # emphasized (bolded) colors
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMC="\[\033[1;36m\]"

    local GITB="\$(__git_ps1)"

    if test -z "$VIRTUAL_ENV" ; then
        local PY_VENV=""
    else
        local PY_VENV="\$(basename \"$VIRTUAL_ENV\") "
    fi

    local UC=$EMC # user's color
    [ $UID -eq "0" ] && UC=$EMR # root's color
    local DC=$EMG # successful command color
    [ $RET != "0" ] && DC=$EMR # last command failed color

    if [[ -n "$1" ]]; then
        PROMPT_TYPE_VAL="$1"
    fi

    if [[ "${PROMPT_TYPE_VAL}" == "empty" ]]; then
        PS1="${DC}\\$ ${NONE}"
    elif [[ "${PROMPT_TYPE_VAL}" == "simple" ]]; then
        PS1="${UC}(\d - \t) \W ${DC}\\$ ${NONE}"
    elif [[ "${PROMPT_TYPE_VAL}" == "default" ]]; then
        PS1=${PS1_OLD_VAL}
    else
        PS1="${EMR}${PY_VENV}${UC}\u [\h] (\d - \t) \W $GITB\n${DC}\\$ ${NONE}"
    fi

}

function prompt_command_base() {
    set_PS1
}

PROMPT_COMMAND="prompt_command_base; $PROMPT_COMMAND_ORIGINAL"

