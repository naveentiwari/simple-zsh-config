alias .1=..
alias .2=../..
alias .3=../../..
alias .4=../../../..
alias .5=../../../../..
alias .6=../../../../../..
alias .7=../../../../../../..
alias cdw="cd $W"
#
# alias user='cut -d: -f1 /etc/passwd'
alias gl="git log --date-order --graph --pretty=format:'%C(bold yellow)%h%Creset %C(bold blue)[%an | %cI] %C(yellow)%d%Creset %s %Creset' --abbrev-commit --date=short"


if [[ "$CVAR_OSNAME" == "linux64" ]]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias getip='ifconfig | grep "inet addr" | cut -d: -f2 | cut -d" " -f1'
fi

if [[ "$CVAR_OSNAME" == "macosx" ]]; then
    alias getip='ifconfig | grep "inet " | cut -d" " -f2'
fi

function mkcd () {
    mkdir -p $1;
    cd $1;
}
