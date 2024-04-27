# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
neofetch
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.config/"

# Define Editor
export EDITOR=nvim

# -------
# ALIASES
# -------

alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'

# ---
# GIT
# ---

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"
alias gittree='git log --oneline --graph --decorate --all'
alias gitfiles='git ls-tree -r master --name-only'

# -----------------
# EDIT CONFIG FILES
# -----------------

alias confp='$EDITOR ~/.config/picom/picom.conf'
alias confb='$EDITOR ~/.config/.bashrc'


# ------------
# MY MOVEMENTS
# ------------
alias pp='cd ~/Documents/personalProjects'
alias artlink='pp && cd Art-Link'
alias artlinkbe='artlink && cd backend'
alias artlinkapp='artlink && cd backend/src/main/java/com/artlink/app'

alias faculdade='cd ~/Documents/faculdade'
alias prjco='faculdade && cd compiladores/projeto/'
alias prjgraf='faculdade && cd computacao_grafica/projeto/'

alias tt='cd ~/Documents/test/'

