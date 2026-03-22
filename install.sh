#!/bin/bash

set -e

echo "📦 Installing packages..."

# Arch packages (edit if needed)
sudo pacman -S --needed --noconfirm \
  hyprland waybar rofi git ttf-font-awesome ttf-dejavu

echo "📁 Creating config folders..."
mkdir -p ~/.config

echo "📂 Copying configs and scripts..."

cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r rofi ~/.config/

echo "🔐 Making scripts executable..."
chmod +x ~/.hypr/scripts/*

if ! command -v yay &> /dev/null; then
  echo "Installing yay..."
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay && makepkg -si --noconfirm
  cd ..
fi

yay -S -- needed --noconfirm \
  python-pywal16

echo "✅ Done! Restart your session or run Hyprland."
