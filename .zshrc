if [ -f ~/dotrepo/zshrc ]; then
    source ~/dotrepo/zshrc
fi

source /Users/sdahiya/.config/broot/launcher/bash/br

test -e "${HOME}/dotrepo/iterm2_shell_integration.zsh" && source "${HOME}/dotrepo/iterm2_shell_integration.zsh"
