#!/bin/bash

echo "You can now go for a break!"

if [ "$1" == "vim"  ]
then
  echo "Installing Vim ..." 
	brew install vim

  # A plug in to install plug ins  
  curl -fsSLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # vim config
  curl -fsSLo $HOME/.vimrc --create-dirs https://raw.githubusercontent.com/JuliaFoerster/bashMacSetUp/master/vim.conf
 
  echo "Installing Vim plugins..."
  vim +"PlugInstall --sync" +qa
fi

if [ "$2" == "sublime" ] 
then
  echo "Installing Sublime ..."
 curl -fsSLo $HOME/.myScriptResources/sublime.dmg --create-dirs https://download.sublimetext.com/Sublime%20Text%20Build%203211.dmg
  hdiutil attach $HOME/.myScriptResources/sublime.dmg
  cp -R /Volumes/Sublime\ Text/Sublime\ Text.app /Appilications/Sublime\ Text.app
  hdiutil unmount /Volumes/Sublime\ Text -force
fi

if [ "$3" == "iTerm" ]
then
  echo "Installing iTerm"
  curl -fsSLo $HOME/.myScriptResources/iTerm2-3_3_11.zip --create-dirs https://iterm2.com/downloads/stable/iTerm2-3_3_11.zip
  unzip -o -q  $HOME/.myScriptResources/iTerm2-3_3_11.zip -d /Applications
fi

if [ "$4" == "ohmyzsh" ]
then
  echo "Installing OhMyZsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi



echo "rm -r $HOME/.myScriptResources"
