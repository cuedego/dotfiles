#!/bin/bash

# Exit immediately if any command fails
set -e

# 0. Check whether the user has sudo privileges
echo "Checking administrator (sudo) privileges..."
if ! sudo -v; then
  echo "❌ Error: User '$USER' does not have permission to use sudo."
  echo "Add the user to the sudo group (as root: usermod -aG sudo $USER) and try again."
  exit 1
fi

# Detect the absolute path of the directory where this script is saved
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Install dependencies
sudo apt update && sudo apt install -y zsh git curl

# 2. Install Oh My Zsh (non-interactive mode)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# 3. Install the Powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM_DIR/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM_DIR/themes/powerlevel10k"
fi

# 4. Install additional plugins
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
fi

# 5. Create symbolic links using the dynamic path
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/p10k.zsh" ~/.p10k.zsh

# 6. Set Zsh as the default shell
sudo chsh -s $(which zsh) $USER

echo "Environment successfully configured from $DOTFILES_DIR! Restart the terminal."
