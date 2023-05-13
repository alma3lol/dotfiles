# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/zsh
export WORK=$HOME/work
export TERM="kitty"
export EDITOR="nvim"
export VISUAL="nvim"

ZSH_THEME="rkj-repos"

plugins=(
	git
	npm
	history-substring-search
	docker
	zsh-syntax-highlighting
	fzf-zsh-plugin
	fzf-tab
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/jump-ranger/jump-ranger.zsh

fpath=($ZSH_CUSTOM/functions $ZSH_CUSTOM/completions $fpath)
# autoload -U $ZSH_CUSTOM/functions/*(:t)
autoload -U $ZSH_CUSTOM/completions/*(:t)

alias lg="lazygit"
alias g="git"
alias ll="ls -lAsh"
alias t="tree -I .git -a"

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# export CONDA_PREFIX="$HOME/anaconda3"
# __conda_setup="$(\"$CONDA_PREFIX/bin/conda\" 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "$CONDA_PREFIX/etc/profile.d/conda.sh" ]; then
#         . "$CONDA_PREFIX/etc/profile.d/conda.sh"
#     else
#         export PATH="$CONDA_PREFIX/bin:$PATH"
#     fi
# fi
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
# unset __conda_setup
# # <<< conda initialize <<<
#
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:/opt/jre/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin:$HOME/.local/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BROWSER=brave

alias n=nvim
alias p=pnpm
alias px=pnpx
alias zl=zellij
alias m=mix

export PATH=$HOME/.cache/rebar3/bin:$PATH

export FZF_ALT_C_COMMAND="rg --hidden --files -g \\!.git --null 2>/dev/null | xargs -0 dirname | uniq"
export FZF_CTRL_T_COMMAND="rg --hidden --files -g \\!.git 2>/dev/null | uniq"

eval "$(starship init zsh)"
eval "$(jump shell)"
eval "$(zoxide init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

[[ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]] && . "/opt/miniconda3/etc/profile.d/conda.sh"
export PATH="$HOME/.mix/escripts${PATH:+:${PATH}}"; export PATH;
[[ -f "/opt/asdf-vm/asdf.sh" ]] && . /opt/asdf-vm/asdf.sh
