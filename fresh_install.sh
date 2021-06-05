# Dont require password for sudo
# note, dont run this script with sudo, otherwise $USER will be 'root'
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

cwd=$(pwd)

sudo apt -y install build-essential
sudo apt -y install curl
sudo apt -y install cmake
sudo apt -y install gimp
sudo apt -y install git
git config --global user.email "Tyler.Liam7@gmail.com"
git config --global user.name "LiamTyler"

# GCC 10
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -q update
sudo apt-get -y install gcc-10
sudo apt-get -y install g++-10
sudo ln -s /usr/bin/gcc-10 /usr/local/bin/gcc
sudo ln -s /usr/bin/g++-10 /usr/local/bin/g++
# TODO: update-alternatives or relink cc/c++?

# Python
sudo apt -y install python3-pip
sudo apt -y install python3-tk
sudo apt -y install idle3
pip3 install numpy
pip3 install matplotlib 

# Renderdoc
sudo apt-get -y install libx11-dev libx11-xcb-dev mesa-common-dev libgl1-mesa-dev libxcb-keysyms1-dev cmake python3-dev bison autoconf automake libpcre3-dev
sudo apt-get -y install qt5-qmake libqt5svg5-dev libqt5x11extras5-dev qt5-default
sudo ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/libGL.so
cd ~
git clone https://github.com/baldurk/renderdoc.git
cd renderdoc
cmake -DCMAKE_BUILD_TYPE=Release -Bbuild -H.
cd build
make -j6
sudo ln -s ~/renderdoc/build/bin/qrenderdoc /usr/local/bin/qrenderdoc

# OpenGL libraries (already installed for renderdoc
# sudo apt-get install mesa-common-dev -y
# sudo apt-get install libglu1-mesa-dev -y

# RandR headers needed for Progression
sudo apt -y install xorg-dev

# vulkan install
cd ~
sudo apt install vulkan-sdk

# Latest Vim
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt update
sudo apt -y install vim

# make vim be default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100

# Install ripgrep 11.0.2
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.0.2_amd64.deb

cd $(cwd)

# Add vulkan syntax highlighting for vim
mkdir -p ~/.vim/syntax/
cp vulkan1.0.vim ~/.vim/syntax

# Fix dual boot time conflict with windows
timedatectl set-local-rtc 1 --adjust-system-clock

sudo apt update
sudo apt -y upgrade

chmod +x install.sh
./install.sh

# Turn off the "system program problem detected" thing
printf "# set this to 0 to disable apport, or to 1 to enable it\n# you can temporarily override this with\n# sudo service apport start force_start=1\nenabled=0" | sudo tee /etc/default/apport

# Allow for the chrome gnome extension to work
sudo apt-get install chrome-gnome-shell

# OTHER TODOS:
# gnome-extensions
# alt-tab group by windows, not apps:
#   https://extensions.gnome.org/extension/15/alternatetab/
# remove alt-tab delay:
#   https://extensions.gnome.org/extension/1403/remove-alttab-delay/

# Remove keyring question: go to Passwords and Keys. Right click on login, change password, blank, confirm
