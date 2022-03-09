export DOTFILES=`dirname $(realpath $HOME/.zshrc)`
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/zsh
export WORK=$HOME/work
export NVIM=$HOME/.config/nvim/config

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
