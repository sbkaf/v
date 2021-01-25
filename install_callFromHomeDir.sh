VIMSETTINGS=$(dirname $0)
ln -s $VIMSETTINGS/tmux.conf ~/.tmux.conf
ln -s $VIMSETTINGS/vimrc ~/.vimrc
if ! grep -q "#CUSTOM" ~/.bashrc
then
  cat $VIMSETTINGS/bashrc >> ~/.bashrc
fi
