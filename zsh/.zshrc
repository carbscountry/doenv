# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Environment Variables and PATH Configuration
# =============================================================================

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Mise activation (development tool version manager)
eval "$(~/.local/bin/mise activate zsh)"

# Cargo environment (Rust package manager)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Nodebrew configuration (Node.js version manager)
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# NVM configuration (Node Version Manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# =============================================================================
# Zinit Plugin Manager Setup
# =============================================================================

# Zinit installation and configuration
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Source zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load zinit annexes (additional functionality)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# =============================================================================
# Prompt Theme Configuration
# =============================================================================

# Powerlevel10k prompt theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Load p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================================================================
# Zsh Plugins
# =============================================================================

# History substring search plugin
zinit load 'zsh-users/zsh-history-substring-search'

# Autosuggestions plugin (suggests commands as you type)
zinit load 'zsh-users/zsh-autosuggestions'

# Syntax highlighting plugin (highlights commands)
zinit load 'zsh-users/zsh-syntax-highlighting'

# =============================================================================
# Key Bindings
# =============================================================================

# Key bindings for history search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# set alias for git & gh
alias gc-b='git checkout -b'
alias gc-m='git commit -m'
alias gp='git push'


# 移動　共通
alias my='cd ~/'
alias des='cd ~/Desktop'
alias dwn='cd ~/Downloads'




[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
