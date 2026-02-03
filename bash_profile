# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi
# User specific environment and startup programs

#PATH=$PATH:$HOME/bin

export PATH

source /home/sdahiya/.config/broot/launcher/bash/br

complete -C /opt/homebrew/bin/terraform terraform
complete -C '$(which aws_completer)' aws
