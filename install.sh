# Variables
ZSH="$HOME/.oh-my-zsh"
DOTFILES=`pwd`
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
clone_plugin_if_not_exists() {
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
link_config_if_not_linked() {
	if [ ! -f $2 ]; then
		ln -s $1 $2
	fi
}

# Required packages
install_package_if_not_installed zsh
install_package_if_not_installed git
install_package_if_not_installed curl

# Dirs
mkdir_if_not_exists $ZSH
mkdir_if_not_exists $ZSH_CUSTOM
mkdir_if_not_exists $ZSH_CUSTOM/plugins

# Config files
link_config_if_not_linked $DOTFILES/.zshrc $HOME/.zshrc
link_config_if_not_linked $DOTFILES/.gitconfig $HOME/.gitconfig

# ZSH Plugins
clone_plugin_if_not_exists https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
clone_plugin_if_not_exists https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
clone_plugin_if_not_exists https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Oh-my-zsh
result=$(sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 2>&1)
if [[ "$result" != *"folder already exists"* ]]; then
	echo "Done installing zsh";
else
	echo "Oh-my-zsh already exists."
fi
