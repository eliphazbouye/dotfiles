#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME

PATH=".snvm/nodejs/node-v20.10.0-linux-x64/bin:$PATH"
