
export ZSH="$HOME/.config/omz"
# Set theme for Oh My Zsh
ZSH_THEME="ys"

# Custom aliases
alias ..='cd ..'
alias v='nvim'

# Plugins to load
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-starship)
source $HOME/.config/omz/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/omz/custom/plugins/zsh-autocomplete/zsh-autocomplete.zsh
source $HOME/.config/omz/custom/plugins/zsh-autocomplete/zsh-autocomplete.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi


source $ZSH/oh-my-zsh.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin:/mnt/DataStore/media/dat/scripts"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Auto-attach to tmux session if not already inside one
if [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi
