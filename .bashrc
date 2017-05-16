# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# User specific aliases and functions
alias h='history'
alias j='jobs -l'
alias ..='cd ..'
alias du='du -h'
alias df='df -h'

alias ls='ls -lh --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd="ls | grep '^[dl]'"
alias lsf="ls -a | grep '^-'"

# For hdfs
alias hls='hdfs dfs -ls -h'
alias hcat='hdfs dfs -cat'
alias hmkdir='hdfs dfs -mkdir'
alias hrm='hdfs dfs -rm'
alias hrmdir='hdfs dfs -rmdir'
alias hmv='hdfs dfs -mv'
alias hput='hdfs dfs -put'
alias hget='hdfs dfs -get'
alias hfind='hdfs dfs -find'
alias hdu='hdfs dfs -du'
alias hdf='hdfs dfs -df'
alias hcp='hdfs dfs -cp'
alias hcount='hdfs dfs -count'
alias hchown='hdfs dfs -chown'
alias hchgrp='hdfs dfs -chgrp'
alias hchmod='hdfs dfs -chmod'
alias htail='hdfs dfs -tail'

# Show cpu/mem situation by order
alias cpu='ps aux|head -1;ps aux|grep -v PID|sort -rn -k +3|head'
alias mem='ps aux|head -1;ps aux|grep -v PID|sort -rn -k +4|head'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.mybashrc ]; then
	. ~/.mybashrc
fi
