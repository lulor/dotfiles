#!/bin/bash

if [ "$(whoami)" = "root" ] ; then
	echo "DO NOT RUN THE SCRIPT AS ROOT!"
	exit 1
fi

CONFIG="$HOME/.config"
BIN="$HOME/.local/bin"

[ ! -d "$CONFIG" ] && mkdir $CONFIG
[ ! -d "$BIN" ] && mkdir -p $BIN

echo "Copying basic config files..."
cp zshrc $HOME/.zshrc
cp vimrc $HOME/.vimrc
cp fdignore $HOME/.fdignore
cp -r config/nvim $CONFIG/
cp -r config/clang $CONFIG/

echo "Copying commands to $BIN..."
cp bin/cinit $BIN/

echo "Checking packages..."
if [ "$(uname | grep -i darwin)" != "" ] ; then
	OS="darwin"
	echo "macOS detected"
	echo "Getting Srcery schemes..."
	curl -sL https://github.com/lulor/srcery-terminal-app/raw/master/Srcery.terminal -O
	curl -sL https://github.com/srcery-colors/srcery-terminal/raw/master/iterm/srcery_iterm.itermcolors -o Srcery.itermcolors
	brew help &> /dev/null
	if [ $? != 0 ] ; then
		echo "Homebrew not installed, aborting..."
		exit 1
	fi
	for pkg in fzf fd neovim; do
		echo "Checking $pkg..."
		brew info $pkg | grep -i "not installed" &> /dev/null
		if [ $? == 0 ] ; then
			echo "$pkg missing, installing..."
			brew install $pkg
			if [ $? != 0 ] ; then
				echo "Error installing $pkg, aborting..."
				exit 1
			fi
		fi
	done
elif [ "$(uname | grep -i linux)" != "" ] ; then
	OS="linux"
	echo "Linux system detected, assuming Debian"
	for pkg in curl fzf fd-find neovim; do
		echo "Checking $pkg..."
		dpkg -s $pkg &> /dev/null
		if [ $? != 0 ] ; then
			echo "$pkg missing, installing..."
			sudo apt-get install $pkg
			if [ $? != 0 ] ; then
				echo "Error installing $pkg, aborting..."
				exit 1
			fi
		fi
	done
else
	echo "Unknown system, aborting..."
	exit 1
fi

# VIM-PLUG
echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -s
echo "Installing vim plugins..."
nvim +PlugInstall +qall

# TMUX
echo "Setting up srcery-tmux..."
srceryTmux="$HOME/.tmux/themes/srcery-tmux"
if [ ! -d "$srceryTmux" ] ; then
	git clone https://github.com/srcery-colors/srcery-tmux/ "$srceryTmux"
fi
cp tmux.conf ~/.tmux.conf

echo "...done"
exit 0
