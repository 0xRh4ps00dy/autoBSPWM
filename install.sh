git clone https://github.com/0xRh4ps00dy/AutoBSPWM.git
sudo apt install -y bspwm sxhkd alacritty
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
cp -r ~/AutoBSPWM/config/bspwm ~/.config
cp -r ~/AutoBSPWM/config/sxhkd ~/.config
chmod +x ~/.config/bspwm/bspwmrc

sudo apt install -y polybar rofi picom flameshot feh zoxide lsd


mkdir -p ~/.config/polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom
cp -r ~/AutoBSPWM/config/polybar ~/.config
cp -r ~/AutoBSPWM/config/rofi ~/.config
cp -r ~/AutoBSPWM/config/alacritty ~/.config
cp -r ~/AutoBSPWM/config/picom ~/.config~
cp ~/AutoBSPWM/scripts/ethernet_status.sh
cp ~/AutoBSPWM/scripts/vpn_status.sh
cp ~/AutoBSPWM/scripts/htb_target.sh 

chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/forest/scripts/*
chmod +x ~/.config/polybar/forest/launch.sh
mkdir -p ~/Wallpapers
cp ~/AutoBSPWM/wallpapers/kali.png ~/Wallpapers
cp ~/AutoBSPWM/scripts/ethernet_status.sh ~/.config/polybar/forest/scripts/
cp ~/AutoBSPWM/scripts/vpn_status.sh ~/.config/polybar/forest/scripts/
cp ~/AutoBSPWM/scripts/htb_target.sh  ~/.config/polybar/forest/scripts/
touch ~/.target
cp -r ~/AutoBSPWM/fonts ~/.local/share/fonts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting


cp ~/AutoBSPWM/.zshrc ~/.zshrc
cp ~/AutoBSPWM/functions ~/.config/functions
cp ~/AutoBSPWM/aliases ~/.config/aliases

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Iosevka.zip
unzip Iosevka.zip -d ~/.local/share/fonts/IosevkaNF

chmod +x ~/AutoBSPWM/scripts/*
sudo ln -s ~/AutoBSPWM/scripts/ligolo_script.sh /usr/local/bin/ligolo_script
sudo ln -s ~/AutoBSPWM/scripts/multihandler.sh /usr/local/bin/multihandler
sudo ln -s ~/AutoBSPWM/scripts/penelope.py /usr/local/bin/pen
sudo ln -s ~/AutoBSPWM/scripts/target.sh /usr/local/bin/target
sudo ln -s ~/AutoBSPWM/scripts/transfile.sh /usr/local/bin/transfile