#! /bin/bash

### UPDATE APT
sudo apt update  # Update apt
sudo apt install zsh
# Wait
echo "======== apt updated ========"
sleep 3

### INSTALL OH-MY-ZSH
echo n | sh -c "$(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)"
# Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
# Wait
echo "======== oh-my-zsh installed ========"
sleep 3

### INSTALL TMUX
sudo apt install tmux
echo "set -g default-terminal "tmux-256color"" >> ~/.tmux.conf
echo "set -as terminal-overrides ",xterm*:Tc"" >> ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
# Wait
echo "======== tmux installed ========"
sleep 3

### INSTALL MICRO
cd
curl https://getmic.ro | bash
# Wait
echo "======== micro installed ========"
sleep 3

# echo "======== set up github profile ========"

# read -p "Enter github username: " USERNAME 
# read -p "Enter github email: " EMAIL 

# git config --global user.name $USERNAME
# git config --global user.email $EMAIL

zsh
exit


