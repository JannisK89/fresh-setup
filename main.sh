#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install Zsh
echo "Installing Zsh..."
sudo apt install zsh -y

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone the Powerlevel10k theme into the Oh-My-Zsh custom themes directory
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set the theme in .zshrc
echo "Configuring .zshrc for Powerlevel10k..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Install tmux
echo "Installing tmux..."
sudo apt install tmux -y

# Install and setup Neovim
echo "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Clone Neovim configuration
echo "Setting up Neovim configuration..."
mkdir -p ${HOME}/.config/nvim
git clone https://github.com/JannisK89/init.lua ${HOME}/.config/nvim

# Install recommended font for Powerlevel10k and Neovim
echo "Installing the recommended Meslo Nerd Font..."
FONT_PATH="$HOME/.local/share/fonts"
mkdir -p $FONT_PATH
curl -fLo "$FONT_PATH/MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -fLo "$FONT_PATH/MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -fLo "$FONT_PATH/MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -fLo "$FONT_PATH/MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Source the .zshrc to apply changes
echo "Sourcing .zshrc..."
source ~/.zshrc

echo "Installation completed. Please restart your terminal!"

