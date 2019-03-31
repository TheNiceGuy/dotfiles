# load environement variables
if [[ ! -f ~/.zshenv ]]; then
	echo "Warning: .zshenv not found!"
else
    source ~/.zshenv
fi

# remove annoying GREP_OPTIONS warning
unset GREP_OPTIONS

# oh-my-zsh settings
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="af-magic"
DISABLE_AUTO_UPDATE="true"

plugins=(git systemd pip)
source $ZSH/oh-my-zsh.sh

# custom alias
alias cd="cd -P"
alias cdpkg="source ~/Software/cdpkg"
alias ls="ls --color=yes"

# execute graphical server if logon is in TTY1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec sway
fi

# add ssh keys
ssh-add ~/.ssh/github &> /dev/null
ssh-add ~/.ssh/bitbucket &> /dev/null
ssh-add ~/.ssh/gitlab &> /dev/null
ssh-add ~/.ssh/gitlab_step &> /dev/null

# execute the warm welcome message
~/Software/welcome
