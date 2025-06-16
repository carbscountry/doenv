#!/bin/bash

set -e  # Exit on error

# Set the DOTFILES directory
DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Ensure source files exist
if [ ! -f "$DOTFILES/.zshrc" ]; then
    echo "Error: Source .zshrc not found at $DOTFILES/.zshrc"
    exit 1
fi

if [ ! -f "$DOTFILES/.p10k.zsh" ]; then
    echo "Error: Source .p10k.zsh not found at $DOTFILES/.p10k.zsh"
    exit 1
fi

# Backup existing .zshrc and .p10k.zsh if they exist
[ -f ~/.zshrc ] && mv -i ~/.zshrc ~/._zshrc
[ -f ~/.p10k.zsh ] && mv -i ~/.p10k.zsh ~/._p10k.zsh

# Create symlinks
echo "Creating symlinks..."
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.p10k.zsh" "$HOME/.p10k.zsh"

# Install zinit if not already installed
if [ ! -d "$HOME/.local/share/zinit" ]; then
    echo "Installing zinit..."
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
else
    echo "zinit is already installed"
fi

# Add Powerlevel10k to .zshrc if not already present
if ! grep -q "zinit light romkatv/powerlevel10k" ~/.zshrc; then
    echo "Adding Powerlevel10k to .zshrc..."
    echo "" >> ~/.zshrc
    echo "# Initialize Powerlevel10k" >> ~/.zshrc
    echo "zinit light romkatv/powerlevel10k" >> ~/.zshrc
fi

if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi

echo "Installation complete! Please restart your shell to apply all changes."
