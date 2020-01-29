rm ~/.bashrc
rm ~/.bash_profile
rm ~/.bash_aliases
rm ~/.vimrc
ln -s `realpath ./.bashrc` ~/.bashrc
ln -s `realpath ./.bash_profile` ~/.bash_profile
ln -s `realpath ./.bash_aliases` ~/.bash_aliases
ln -s `realpath ./.vimrc` ~/.vimrc
