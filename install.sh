ln -s $(pwd)/vimrc ~/.vimrc
if ! grep -q "#CUSTOM" ~/.bashrc
then
  cat ./bashrc >> ~/.bashrc
fi
