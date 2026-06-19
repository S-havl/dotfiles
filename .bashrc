#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

########################################
# ALIAS
########################################
alias ls='ls --color=auto'
alias grep='grep --color=auto'

########################################
# PROMPT
########################################
PASTEL_BLUE='\[\e[38;5;110m\]'
PASTEL_GREEN='\[\e[38;5;150m\]'
PASTEL_LAVENDER='\[\e[38;5;146m\]'
MUTED_GRAY='\[\e[38;5;247m\]'
RESET='\[\e[0m\]'

PS1="${PASTEL_BLUE}\w ${PASTEL_GREEN}❯${RESET} "
