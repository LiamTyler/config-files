rm -f ~/.bashrc
rm -f ~/.bash_profile
rm -f ~/.bash_aliases
rm -f ~/.vimrc
ln -s `realpath ./.bashrc` ~/.bashrc
ln -s `realpath ./.bash_profile` ~/.bash_profile
ln -s `realpath ./.bash_aliases` ~/.bash_aliases
ln -s `realpath ./.vimrc` ~/.vimrc
