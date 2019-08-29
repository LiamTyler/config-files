# Dont require password for sudo
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

# Package installs:
sudo apt -y install build-essential
sudo apt -y install curl
sudo apt -y install git
sudo apt -y install cmake
sudo apt -y install python3-pip
sudo apt -y install gimp
sudo apt -y install python3-tk
sudo apt -y install idle3

# install latest vim
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update
sudo apt -y install vim

# Manual installs:
# Install ripgrep 11.0.2
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sujo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

# Python pip packages:
pip3 install numpy
pip3 install matplotlib 

# Add vulkan syntax highlighting for vim
mkdir -p ~/.vim/syntax/
cp vulkan1.0.vim ~/.vim/syntax

# Fix dual boot time conflict with windows
timedatectl set-local-rtc 1 --adjust-system-clock

sudo apt update
sudo apt -y upgrade
