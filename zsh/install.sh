#!/bin/bash

# Set the DOTFILES directory
DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Backup existing .zshrc
mv -i ~/.zshrc ~/._zshrc && mv -i ~/.p10k.zsh ~/._p10k.zsh

# Set zsh as default shell
sudo ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
sudo ln -s "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Install Powerlevel10k using zinit
zinit light romkatv/powerlevel10k
# Source the .zshrc to apply changes
source ~/.zshrc
