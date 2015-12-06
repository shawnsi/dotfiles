#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Setup bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setup prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# Set default editor
export EDITOR=vim

# Golang configuration
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Secure pastebin
function post {
	gpg --batch --armor --encrypt --recipient "$1" | curl -F "clbin=<-" https://clbin.com
}

function get {
	curl -s "$1" | gpg --batch --quiet --armor --decrypt -
}
