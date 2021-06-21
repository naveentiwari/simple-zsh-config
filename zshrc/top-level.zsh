export CVAR_ZSH_SCRIPT_HOME=${0:a:h}

ADOTDIR=$CVAR_ZSH_DYN_LOC/antigen

source "$CVAR_ZSH_SCRIPT_HOME/alias.zsh"
source "$CVAR_ZSH_SCRIPT_HOME/antigen.zsh"
source "$CVAR_ZSH_SCRIPT_HOME/p10k.zsh"
source "$CVAR_ZSH_SCRIPT_HOME/zshrc.zsh"

antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k

antigen bundle dotphiles/dotzsh

antigen apply

doOnce

