# Set the location of Oh My Zsh
export ZSH="$HOME/.config/omz"
export ZSH_CUSTOM="$ZSH/custom"

# Set theme for Oh My Zsh
ZSH_THEME="ys"

# Custom aliases
alias ..='cd ..'
alias v='nvim'

# Plugins to load
plugins=(
  git
  zsh-autocomplete
  zsh-interactive-cd
  zsh-navigation-tools
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  spaceship-vi-mode
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# spaceship-vi-mode display customization (override after sourcing)
export SPACESHIP_VI_MODE_NORMAL_PREFIX=$'\e[1;36m❮\e[0m'

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin:/mnt/DataStore/media/dat/scripts"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

