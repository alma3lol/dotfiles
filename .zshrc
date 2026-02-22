# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH=$HOME/.oh-my-zsh
export WORK=$HOME/work
# export TERM="kitty"
export EDITOR="nvim"
export VISUAL="nvim"

export ANTIGEN_LOG=$HOME/antigen.log

source $HOME/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle unixorn/fzf-zsh-plugin@main
antigen bundle gsamokovarov/jump-ranger
antigen bundle alexanderjeurissen/ranger_devicons@main
antigen bundle cjbassi/ranger-fzf
antigen bundle Aloxaf/fzf-tab
antigen bundle esc/conda-zsh-completion
antigen bundle fdw/ranger_autojump@main

antigen theme rkj-repos

antigen apply

export ZSH_CUSTOM=$HOME/zsh

fpath=($ZSH_CUSTOM/functions $ZSH_CUSTOM/completions $fpath)
# autoload -U $ZSH_CUSTOM/functions/*(:t)
autoload -U $ZSH_CUSTOM/completions/*(:t)

alias lg="lazygit"
alias g="git"
alias ll="ls -lAsh"
alias t="tree -I .git -a"

export ASDF_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"

export ANDROID_SDK_ROOT="$HOME/Android/Sdk"

export PATH="$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:/opt/jre/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BROWSER=brave

alias n=nvim
alias p=pnpm
alias px=pnpx
alias ze=zellij
alias zl=zlayouts
alias zs=zsessions
alias m=mix
alias e="exa -bTl"
alias kp=kprojects
alias ifc="ifconfig \$(ifconfig | grep mtu | grep -v br | grep -v veth | grep -vw lo | awk -F: '{print \$1}' | fzf)"

export PATH=$PATH:$HOME/.cache/rebar3/bin

export FZF_ALT_C_COMMAND="rg --hidden --files -g \\!.git --null 2>/dev/null | xargs -0 dirname | uniq"
export FZF_CTRL_T_COMMAND="rg --hidden --files -g \\!.git 2>/dev/null | uniq"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export PATH="$PATH:$HOME/perl5/bin";
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

[ command -v gh &> /dev/null ] && . $(gh completion -s zsh)

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export PATH="$ASDF_DIR/shims:$HOME/.local/bin:$PATH:/var/lib/snapd/snap/bin:$HOME/.mix/escripts"

[[ "$(which starship)" != *"not found" ]] && eval "$(starship init zsh)"
[[ "$(which jump)" != *"not found" ]] && eval "$(jump shell)"
[[ "$(which zoxide)" != *"not found" ]] && eval "$(zoxide init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$(asdf which conda | sed 's/\/bin\/conda//g')/etc/profile.d/conda.sh" ]; then
        . "$(asdf which conda | sed 's/\/bin\/conda//g')/etc/profile.d/conda.sh"
    else
        export PATH="$(asdf which conda | sed 's/\/bin\/conda//g')/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

export GIHUB_TOKEN=$(gpg -d $HOME/.github-token.txt.gpg 2>/dev/null)
export GITHUB_PERSONAL_ACCESS_TOKEN=$GIHUB_TOKEN

export LINEAR_API_KEY=$(gpg -d $HOME/linear-api-key.txt.gpg 2>/dev/null)

export PLANE_API_KEY=$(gpg -d $HOME/plane-api-key.txt.gpg 2>/dev/null)
export PLANE_API_BASE="https://project.cipher.ly"
export PLANE_WORKSPACE_SLUG="main"

# OpenClaw Completion
source "$HOME/.openclaw/completions/openclaw.zsh"

export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.dotnet/tools/"
export DOTNET_ROOT="$HOME/.dotnet"
