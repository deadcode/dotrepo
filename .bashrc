if [ -f ~/dotrepo/bashrc ]; then
    #echo "sourcing"
    source ~/dotrepo/bashrc
fi

source /Users/sdahiya/.config/broot/launcher/bash/br

test -e "${HOME}/dotrepo/iterm2_shell_integration.bash" && source "${HOME}/dotrepo/iterm2_shell_integration.bash"
