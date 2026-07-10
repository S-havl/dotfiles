[[ $- != *i* ]] && return

shopt -s histappend
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

_prompt_command() {
    local EXIT_STATUS=$?
    local DIR_COLOR='\[\e[34m\]'
    local SUCCESS_COLOR='\[\e[32m\]'
    local ERROR_COLOR='\[\e[31m\]'
    local RESET='\[\e[0m\]'
    
    local SYMBOL_COLOR=$SUCCESS_COLOR
    [ $EXIT_STATUS -ne 0 ] && SYMBOL_COLOR=$ERROR_COLOR

    PS1="${DIR_COLOR}\w ${SYMBOL_COLOR}❯${RESET} "
}

PROMPT_COMMAND=_prompt_command
