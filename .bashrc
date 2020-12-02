# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

alias ll='ls --show-control-chars --color=none -ovlpF'
alias lll='ls --show-control-chars --color=none --full-time -valpF'
alias la='ls --show-control-chars --color=none -vpCaF'
alias ls='ls --show-control-chars --color=none -vpCF'
alias l.='ls --show-control-chars --color=none -d .[a-zA-Z]*'
alias .='pwd'
alias ..='cd ..'
alias h='history'
alias s='source'
alias a='source .venv/bin/activate'

export PAGER='less'
export LESS='-M'
export EDITOR='vim'
export VISUAL='vim'
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

umask 022

#export PS1="[\w]$ "
export PS2='> '
export PS4='+ '

export HISTIGNORE="&:ls:ll:[bf]g:exit"

alias d2h="perl -e 'printf qq|%X\n|, int( shift )'"
alias d2o="perl -e 'printf qq|%o\n|, int( shift )'"
alias d2b="perl -e 'printf qq|%b\n|, int( shift )'"
alias h2d="perl -e 'printf qq|%d\n|, hex( shift )'"
alias h2o="perl -e 'printf qq|%o\n|, hex( shift )'"
alias h2b="perl -e 'printf qq|%b\n|, hex( shift )'"
alias o2h="perl -e 'printf qq|%X\n|, oct( shift )'"
alias o2d="perl -e 'printf qq|%d\n|, oct( shift )'"
alias o2b="perl -e 'printf qq|%b\n|, oct( shift )'"
