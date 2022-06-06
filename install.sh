#!/bin/bash

if [ ! -f /bin/zsh ]
then
	echo "You need to install zsh."
	exit 255
fi

if [ ! -d ~/.oh-my-zsh/ ]
then
	echo "You need to install oh-my-zsh first."
	read -p "Install (y/N)?: " INSTALL_OHMYZSH
	if [[ $INSTALL_OHMYZSH == "n" || $INSTALL_OHMYZSH == "N" || $INSTALL_OHMYZSH == "" ]]
	then
		echo "Exiting"
		exit 255
	fi
fi

if [ -f $(which curl) ]
then
	if [[ $INSTALL_OHMYZSH = "y" || $INSTALL_OHMYZSH = "Y" ]]
	then
		 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
	curl -fsSL https://raw.githubusercontent.com/ivabus/ivabus-zsh-theme/master/ivabus.zsh-theme > ~/.oh-my-zsh/custom/themes/ivabus.zsh-theme
	echo "Now you need to set ivabus as your ZSH_THEME in .zshrc"
fi