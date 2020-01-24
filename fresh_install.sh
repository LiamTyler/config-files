# Dont require password for sudo
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

sudo apt -y install build-essential
sudo apt -y install curl
sudo apt -y install git
sudo apt -y install cmake
sudo apt -y install gimp

# GCC 9
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -q
sudo apt-get install gcc-9 -y
sudo apt-get install g++-9 -y
sudo ln -s /usr/bin/gcc-9 /usr/local/bin/gcc
sudo ln -s /usr/bin/g++-9 /usr/local/bin/g++

# Python
sudo apt -y install python3-pip
sudo apt -y install python3-tk
sudo apt -y install idle3
pip3 install numpy
pip3 install matplotlib 

# Renderdoc
sudo apt-get install libx11-dev libx11-xcb-dev mesa-common-dev libgl1-mesa-dev libxcb-keysyms1-dev cmake python3-dev bison autoconf automake libpcre3-dev -y
sudo apt-get install qt5-qmake libqt5svg5-dev libqt5x11extras5-dev
sudo ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/libGL.so
cd ~
git clone https://github.com/baldurk/renderdoc.git
cd renderdoc
mkdir build
cmake -DCMAKE_BUILD_TYPE=Release -H..
make -j4
sudo ln -s ~/renderdoc/build/bin/qrenderdoc /usr/local/bin/qrenderdoc

# OpenGL libraries (already installed for renderdoc
# sudo apt-get install mesa-common-dev -y
# sudo apt-get install libglu1-mesa-dev -y

# vulkan install
cd ~
curl -LO https://vulkan.lunarg.com/sdk/home#sdk/downloadConfirm/1.1.121.0/linux/vulkansdk-linux-x86_64-1.1.121.0.tar.gz
tar zxf vulkansdk-linux-x86_64-1.1.121.0.tar.gz
mv 1.1.121.0 vulkan


# Latest Vim
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update
sudo apt -y install vim

# Install ripgrep 11.0.2
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

# Add vulkan syntax highlighting for vim
mkdir -p ~/.vim/syntax/
cp vulkan1.0.vim ~/.vim/syntax

# Fix dual boot time conflict with windows
timedatectl set-local-rtc 1 --adjust-system-clock

sudo apt update
sudo apt -y upgrade
