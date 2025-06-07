# Install gh

if command -v gh >/dev/null 2>&1; then
  echo "gh is already installed."
else
  echo "Installing gh..."
  brew install gh
fi

# Copy config.yml to ~/.config/gh/config.yml
mkdir -p ~/.config/gh
cp -i "$(dirname "$0")/config.yml" ~/.config/gh/config.yml
