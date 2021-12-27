# Variables
ZSH="$HOME/.oh-my-zsh"
DOTFILES=`realpath $(dirname $0)`
ZSH_CUSTOM="$DOTFILES/zsh"
package_manager_command=''

# Checks
case `cat /etc/os-release | grep ID_LIKE | sed -e 's/ID_LIKE=//g'` in
	debian)
		package_manager_command='apt install -y'
		;;
	arch)
		package_manager_command='pacman -S --noconfirm'
		;;
esac

# Functions
mkdir_if_not_exists() {
	if [ ! -d $1 ]; then
		mkdir -p $1;
	fi
}
clone_if_not_exists() {
	if [ ! -d $2 ]; then
		git clone $1 $2
	fi
}
install_package_if_not_installed() {
	result=$(which $1 2>&1)
	if [[ "$result" == *"no $1"* ]]; then
		`sudo $package_manager_command $1`;
	fi
}
link_if_not_linked() {
	if [ ! -f $2 ]; then
		ln -s $1 $2
	fi
}

# Required packages
install_package_if_not_installed zsh
install_package_if_not_installed git
install_package_if_not_installed curl

# Dirs
mkdir_if_not_exists $HOME/.config/nvim
mkdir_if_not_exists $ZSH_CUSTOM
mkdir_if_not_exists $ZSH_CUSTOM/plugins

# (Neo)Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
clone_if_not_exists https://github.com/alma3lol/neovim-config $DOTFILES/nvim-config

# ZSH Plugins
clone_if_not_exists https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
clone_if_not_exists https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
clone_if_not_exists https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

# Config files
link_if_not_linked $DOTFILES/.zshrc $HOME/.zshrc
link_if_not_linked $DOTFILES/.gitconfig $HOME/.gitconfig
link_if_not_linked $DOTFILES/.vimrc $HOME/.vimrc
link_if_not_linked $DOTFILES/nvim-init.vim $HOME/.config/nvim/init.vim
link_if_not_linked $DOTFILES/nvim-config $HOME/.config/nvim/config

# Initiating vim
result=$(which vim 2>&1)
if [[ "$result" == *"no vim"* ]]; then
	vim +PlugInstall +qall
fi

# Initiating neovim
result=$(which vim 2>&1)
if [[ "$result" == *"no vim"* ]]; then
	nvim --headless +PlugInstall +qa
fi
