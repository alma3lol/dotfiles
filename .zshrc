realpath_DOTFILES=`realpath $0`
export DOTFILES=`dirname $realpath_DOTFILES`
export ZSH_CUSTOM="$DOTFILES/zsh"
export WORK="$HOME/work"

ZSH_THEME="rkj-repos"

plugins=(
	git
	npm
	history-substring-search
	docker
	zsh-syntax-highlighting
	zsh-syntax-highlighting
)

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath=($ZSH_CUSTOM/functions $ZSH_CUSTOM/completions $fpath)
autoload -U $ZSH_CUSTOM/functions/*(:t)
autoload -U $ZSH_CUSTOM/completions/*(:t)

alias lg="lazygit"
alias g="git"
alias ll="ls -lA"
alias t="tree -I .git -a"
