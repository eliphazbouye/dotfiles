#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias arch-update='paru -Syu'

alias gb='git branch'
alias gs='git switch'
alias gsc='git switch -c'
alias gss='git status'
alias ga='git add'
alias gap='git add -p'
alias gad='git add .'
alias gaa='git add -A'
alias gcm='git commit -m'

alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias lh='ls -lh --color=auto'

PATH="$HOME/.envm/nodejs/node-v20.10.0-linux-x64/bin:$PATH"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
