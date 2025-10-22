#!/bin/bash

set -e

echo "[*] Installing main packages..."
sudo apt update
sudo apt install -y bspwm sxhkd alacritty polybar rofi xcompmgr flameshot feh lsd numlockx ufw sshpass bat

echo "[*] Creating configuration directories..."
for dir in bspwm sxhkd polybar rofi alacritty; do
  mkdir -p "$HOME/.config/$dir"
done
mkdir -p "$HOME/Wallpapers" "$HOME/.local/share/fonts"

echo "[*] Copying configuration files..."
for cfg in bspwm sxhkd polybar rofi alacritty; do
  cp -r "$HOME/autoBSPWM/config/$cfg" "$HOME/.config"
done

chmod +x "$HOME/.config/bspwm/bspwmrc"
chmod +x "$HOME/autoBSPWM/scripts/"*
chmod +x "$HOME/.config/polybar/launch.sh"
chmod +x "$HOME/.config/polybar/forest/launch.sh"
chmod +x "$HOME/.config/polybar/forest/scripts/"*

echo "[*] Copying wallpapers and fonts..."
cp "$HOME/autoBSPWM/wallpapers/kali.png" "$HOME/Wallpapers"
cp -r "$HOME/autoBSPWM/fonts" "$HOME/.local/share/fonts"

echo "[*] Copying Polybar scripts..."
cp "$HOME/autoBSPWM/scripts/ethernet_status.sh" "$HOME/.config/polybar/forest/scripts/"
cp "$HOME/autoBSPWM/scripts/vpn_status.sh" "$HOME/.config/polybar/forest/scripts/"
cp "$HOME/autoBSPWM/scripts/htb_target.sh" "$HOME/.config/polybar/forest/scripts/"

echo "[*] Creating auxiliary files..."
touch "$HOME/.target" "$HOME/.ctf_vars"

echo "[*] Installing Oh My Zsh and plugins..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" || true

echo "[*] Copying personal configuration files..."
cp "$HOME/autoBSPWM/.zshrc" "$HOME/.zshrc"
cp "$HOME/autoBSPWM/functions" "$HOME/.config/functions"
cp "$HOME/autoBSPWM/aliases" "$HOME/.config/aliases"

echo "[*] Creating symlinks for scripts..."
sudo ln -sf "$HOME/autoBSPWM/scripts/ligolo_script.sh" /usr/local/bin/ligolo_script
sudo ln -sf "$HOME/autoBSPWM/scripts/multihandler.sh" /usr/local/bin/multihandler
sudo ln -sf "$HOME/autoBSPWM/scripts/penelope.py" /usr/local/bin/pen
sudo ln -sf "$HOME/autoBSPWM/scripts/target.sh" /usr/local/bin/target
sudo ln -sf "$HOME/autoBSPWM/scripts/transfile.sh" /usr/local/bin/transfile

echo "[*] Copying and setting permissions for proxy script..."
sudo cp "$HOME/autoBSPWM/scripts/proxy" /usr/local/bin/proxy
sudo chmod +x /usr/local/bin/proxy

echo "[*] Migrating Alacritty config..."
alacritty migrate || true

echo "[*] Setting permissions for bspwm_resize script..."
sudo chmod +x "$HOME/.config/bspwm/scripts/bspwm_resize" || true

echo "[+] Installation completed."
