
# Set the DOTFILES directory
DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Install mise (https://github.com/jdx/mise)
if command -v mise >/dev/null 2>&1; then
  echo "mise is already installed."
else
  echo "Installing mise..."
  # curl https://mise.run | sh
  brew install mise
fi

mise settings set python_compile 1

cp $DOTFILES/config.toml ~/.config/mise/
echo "Copied $DOTFILES/mise/config.toml to ~/.config/mise/config.toml."

if [ -f "$DOTFILES/config.toml" ]; then
  echo "Applying config.toml to mise..."
  mise install
else
  echo "config.toml not found. Skipping import."
fi
