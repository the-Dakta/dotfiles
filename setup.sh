#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR=~/dotfiles

# List of configurations to be stowed to the home directory
HOME_CONFIGS=("omz" "zsh")
# Function to stow packages to a specified target
stow_package() {
  local package=$1
  local target=$2
  stow --dir="$DOTFILES_DIR" --target="$target" "$package"
}

# Ensure ~/.config directory exists
mkdir -p ~/.config

# Iterate over each directory in the dotfiles directory
for package in "$DOTFILES_DIR"/*; do
  # Only process directories
  if [[ -d "$package" ]]; then
    package_name=$(basename "$package")
    if [[ " ${HOME_CONFIGS[@]} " =~ " $package_name " ]]; then
      # Stow packages to the home directory
      stow_package "$package_name" ~
    else
      # Stow packages to the ~/.config directory
      stow_package "$package_name" ~/.config
    fi
  fi
done

echo "Dotfiles have been successfully stowed."

