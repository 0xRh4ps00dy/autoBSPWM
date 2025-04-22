sudo apt install -y bspwm sxhkd alacritty
sleep 1

mkdir -p ~/.config/bspwm
sleep 1

mkdir -p ~/.config/sxhkd
sleep 1

cp -r ~/AutoBSPWM/config/bspwm ~/.config
sleep 1

cp -r ~/AutoBSPWM/config/sxhkd ~/.config
sleep 1

chmod +x ~/.config/bspwm/bspwmrc
sleep 1

sudo apt install -y polybar rofi picom flameshot feh zoxide lsd
sleep 1


mkdir -p ~/.config/polybar
sleep 1

mkdir -p ~/.config/rofi
sleep 1

mkdir -p ~/.config/alacritty
sleep 1

mkdir -p ~/.config/picom
sleep 1
cp -r ~/AutoBSPWM/config/polybar ~/.config
sleep 1

cp -r ~/AutoBSPWM/config/rofi ~/.config
sleep 1

cp -r ~/AutoBSPWM/config/alacritty ~/.config
sleep 1

cp -r ~/AutoBSPWM/config/picom ~/.config
sleep 1

chmod +x ~/AutoBSPWM/scripts/*
sleep 1

cp ~/AutoBSPWM/scripts/ethernet_status.sh
sleep 1

cp ~/AutoBSPWM/scripts/vpn_status.sh
sleep 1

cp ~/AutoBSPWM/scripts/htb_target.sh 

chmod +x ~/.config/polybar/launch.sh
sleep 1

chmod +x ~/.config/polybar/forest/scripts/*
sleep 1

chmod +x ~/.config/polybar/forest/launch.sh
sleep 1

mkdir -p ~/Wallpapers
sleep 1

cp ~/AutoBSPWM/wallpapers/kali.png ~/Wallpapers
sleep 1

cp ~/AutoBSPWM/scripts/ethernet_status.sh ~/.config/polybar/forest/scripts/
sleep 1

cp ~/AutoBSPWM/scripts/vpn_status.sh ~/.config/polybar/forest/scripts/
sleep 1

cp ~/AutoBSPWM/scripts/htb_target.sh  ~/.config/polybar/forest/scripts/
sleep 1

touch ~/.target
sleep 1

cp -r ~/AutoBSPWM/fonts ~/.local/share/fonts
sleep 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sleep 1

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 1

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 1

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
sleep 1


cp ~/AutoBSPWM/.zshrc ~/.zshrc
sleep 1

cp ~/AutoBSPWM/functions ~/.config/functions
sleep 1

cp ~/AutoBSPWM/aliases ~/.config/aliases
sleep 1



sudo ln -s ~/AutoBSPWM/scripts/ligolo_script.sh /usr/local/bin/ligolo_script
sleep 1

sudo ln -s ~/AutoBSPWM/scripts/multihandler.sh /usr/local/bin/multihandler
sleep 1

sudo ln -s ~/AutoBSPWM/scripts/penelope.py /usr/local/bin/pen
sleep 1

sudo ln -s ~/AutoBSPWM/scripts/target.sh /usr/local/bin/target
sleep 1

sudo ln -s ~/AutoBSPWM/scripts/transfile.sh /usr/local/bin/transfile
sleep 1


alacritty migrate
sleep 1

touch ~/.ctf_vars
sleep 1

sudo apt install -y ufw sshpass bat
sleep 1

cp ~/AutoBSPWM/scripts/proxy /usr/local/bin/proxy
sleep 1

sudo chmod +x /usr/local/bin/proxy
sleep 1