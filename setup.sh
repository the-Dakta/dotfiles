#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR=~/dotfiles

# List of configurations to be stowed directly to the home directory
HOME_CONFIGS=("zsh" "tmux")

# Function to stow packages to a specified target
stow_package() {
  local package=$1
  local target=$2
  stow --dir="$DOTFILES_DIR" --target="$target" "$package"
}

# Ensure ~/.config directory exists
mkdir -p ~/.config

# Initialize and update all submodules
git -C "$DOTFILES_DIR" submodule update --init --recursive

# Iterate over each directory in the dotfiles directory
for package in "$DOTFILES_DIR"/*; do
  # Only process directories
  if [[ -d "$package" ]]; then
    package_name=$(basename "$package")
    if [[ " ${HOME_CONFIGS[@]} " =~ " $package_name " ]]; then
      # Stow packages to the home directory
      stow_package "$package_name" ~
    else
      # Stow packages to the ~/.config/package_name directory
      mkdir -p ~/.config/"$package_name"
      stow_package "$package_name" ~/.config/"$package_name"
    fi
  fi
done

echo "Dotfiles have been successfully stowed."

if [ -z "$ZSH_CUSTOM" ]; then
  export ZSH_CUSTOM=$HOME/omz/custom
fi

# spaceship-vi-mode plugin installation
if [ ! -d "$ZSH_CUSTOM/plugins/spaceship-vi-mode" ]; then
  echo "Cloning spaceship-vi-mode plugin..."
  git clone https://github.com/spaceship-prompt/spaceship-vi-mode.git ${ZSH_CUSTOM:-$HOME/omz/custom}/plugins/spaceship-vi-mode
fi
