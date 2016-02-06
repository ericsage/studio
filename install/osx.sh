
cp ../config/bash ~/.bash_profile
cp ../config/git  ~/.gitconfig
cp ../config/tmux ~/.tmux.conf
cp ../config/vim ~/.vimrc

cp ../terminal/* ~/Desktop

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew install vim tmux docker docker-machine

echo "Installed brew, vim, tmux, docker, and docker machine."

../font/install.sh

echo "Enter" | vim +PluginInstall || true

echo "To complete the installation, open one of the terminals on the Desktop and set it's font to a powerline font."
