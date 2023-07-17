# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# All dotfiles are versioned in DOTFILES_DIR
DOTFILES_DIR=~/dotrepo

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
if [ -n "${BASH_VERSION}" ]; then
    shopt -s histappend
elif [ -n "${ZSH_VERSION}" ]; then
    echo "ZSH History??"
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
if [ -n "${BASH_VERSION}" ]; then
    shopt -s checkwinsize
elif [ -n "${ZSH_VERSION}" ]; then
    echo "ZSH windowsize??"
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -n "${BASH_VERSION}" ] && [ -f ${DOTFILES_DIR}/iterm2_shell_integration ]; then
    source ${DOTFILES_DIR}/iterm2_shell_integration.bash
fi

if [ -e ${DOTFILES_DIR}/functions ]; then
    source ${DOTFILES_DIR}/functions
fi

if [ -e ${DOTFILES_DIR}/environment ]; then
    source ${DOTFILES_DIR}/environment
fi

if [ -e ${DOTFILES_DIR}/prompt ]; then
    source ${DOTFILES_DIR}/prompt
fi
