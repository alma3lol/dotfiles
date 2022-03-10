export DOTFILES=`dirname $(realpath $HOME/.zshrc)`
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/zsh
export WORK=$HOME/work
export NVIM=$HOME/.config/nvim/config
export TERM="xterm-256color"

ZSH_THEME="rkj-repos"

plugins=(
	git
	npm
	history-substring-search
	docker
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath=($ZSH_CUSTOM/functions $ZSH_CUSTOM/completions $fpath)
autoload -U $ZSH_CUSTOM/functions/*(:t)
autoload -U $ZSH_CUSTOM/completions/*(:t)

alias lg="lazygit"
alias g="git"
alias ll="ls -lAsh"
alias t="tree -I .git -a"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
