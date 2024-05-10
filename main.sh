#!/bin/bash

# Update package list
echo "Updating package list"
sudo apt update

# Install Zsh
echo "Installing Zsh"
sudo apt install zsh -y
chsh -s $(which zsh)


# Install tmux
echo "Installing tmux, tpm and config file."
sudo apt install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wget https://raw.githubusercontent.com/JannisK89/config-files/main/.tmux.conf

# Install and setup Neovim
echo "Installing Neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
sudo apt install libfuse2
sudo apt install gcc

# Clone Neovim configuration
echo "Setting up Neovim configuration"
mkdir -p ${HOME}/.config/nvim
git clone https://github.com/JannisK89/init.lua ${HOME}/.config/nvim

# Clone the Powerlevel10k theme into the Oh-My-Zsh custom themes directory
echo "Installing Powerlevel10k theme, plugins and config file"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc
wget https://raw.githubusercontent.com/JannisK89/config-files/main/.zshrc

echo "Installation completed. Please restart your terminal!"

