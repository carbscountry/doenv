# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# git
brew install git

# nvm & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.zshrc
nvm install stable --latest-npm

# cursor
brew install --cask cursor

# Arc Browser
brew install --cask arc

# Raycast
brew install --cask raycast

# claude code
npm install -g @anthropic-ai/claude-code