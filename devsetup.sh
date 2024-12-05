#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
# dotfiles directory
dir=~/dotfiles
# old dotfiles backup directory
olddir=~/dotfiles_old
# list of files/folders to symlink in homedir
files=".tmux.conf .zshrc .vimrc .aliases .functions .gitconfig .gitignore .gemrc .ackrc"
platform=$(uname)
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done
echo "done"

install_osx_apps () {
  # install homebrew
  echo "installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "done"

  # install some taps
  echo "installing some taps"
  taps="ag cmake ctags tmux vim node reattach-to-user-namespace wget jupyter noti ruff"
  for tap in $taps; do
    brew install $tap
  done
  echo "done"

  # install some apps"
  echo "installing some apps"
  apps="google-chrome iterm2 postman sublime-text slack"
  for app in $apps; do
    brew install $app
  done
  echo "done"
}

install_linux_apps (){
  sudo apt-get install -y silversearcher-ag cmake exuberant-ctags tmux vim nodejs npm
  sudo apt install -y python3-pip
}

if [[ $platform == 'Linux' ]]; then
  install_linux_apps
elif [[ $platform == 'Darwin' ]]; then
  install_osx_apps
fi

# install vim-plug
echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/dotfiles/.vim
ln -s ~/dotfiles/.vim ~/.vim
echo "done"

# install vim plugins
echo "installing vim plugins"
vim +PlugInstall +qall
echo "done"

# install coc extensions
vim -c 'CocInstall -sync coc-pyright coc-json|q'

# install zsh
install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then

    # Clone the oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d ~/.oh-my-zsh/ ]]; then
      echo "installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      echo "done"
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
    fi
  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
      sudo apt-get install zsh
      install_zsh
      # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo "Please install zsh, then re-run this script!"
      exit
    fi
  fi
}

install_zsh

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
