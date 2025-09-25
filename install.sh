sudo apt install -y bspwm sxhkd alacritty
sleep 1

mkdir -p $HOME/.config/bspwm
sleep 1

mkdir -p $HOME/.config/sxhkd
sleep 1

cp -r $HOME/autoBSPWM/config/bspwm $HOME/.config
sleep 1

cp -r $HOME/autoBSPWM/config/sxhkd $HOME/.config
sleep 1

chmod +x $HOME/.config/bspwm/bspwmrc
sleep 1

sudo apt install -y polybar rofi xcompmgr flameshot feh lsd numlockx
sleep 1


mkdir -p $HOME/.config/polybar
sleep 1

mkdir -p $HOME/.config/rofi
sleep 1

mkdir -p $HOME/.config/alacritty
sleep 1

# mkdir -p $HOME/.config/picom
# sleep 1
cp -r $HOME/autoBSPWM/config/polybar $HOME/.config
sleep 1

cp -r $HOME/autoBSPWM/config/rofi $HOME/.config
sleep 1

cp -r $HOME/autoBSPWM/config/alacritty $HOME/.config
sleep 1

# cp -r $HOME/autoBSPWM/config/picom $HOME/.config
# sleep 1

chmod +x $HOME/autoBSPWM/scripts/*
sleep 1

chmod +x $HOME/.config/polybar/launch.sh
sleep 1

chmod +x $HOME/.config/polybar/forest/scripts/*
sleep 1

chmod +x $HOME/.config/polybar/forest/launch.sh
sleep 1

mkdir -p $HOME/Wallpapers
sleep 1

cp $HOME/autoBSPWM/wallpapers/kali.png $HOME/Wallpapers
sleep 1

cp $HOME/autoBSPWM/scripts/ethernet_status.sh $HOME/.config/polybar/forest/scripts/
sleep 1

cp $HOME/autoBSPWM/scripts/vpn_status.sh $HOME/.config/polybar/forest/scripts/
sleep 1

cp $HOME/autoBSPWM/scripts/htb_target.sh  $HOME/.config/polybar/forest/scripts/
sleep 1

touch $HOME/.target
sleep 1

cp -r $HOME/autoBSPWM/fonts $HOME/.local/share/fonts
sleep 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sleep 1

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 1

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 1

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
sleep 1


cp $HOME/autoBSPWM/.zshrc $HOME/.zshrc
sleep 1

cp $HOME/autoBSPWM/functions $HOME/.config/functions
sleep 1

cp $HOME/autoBSPWM/aliases $HOME/.config/aliases
sleep 1



sudo ln -s $HOME/autoBSPWM/scripts/ligolo_script.sh /usr/local/bin/ligolo_script
sleep 1

sudo ln -s $HOME/autoBSPWM/scripts/multihandler.sh /usr/local/bin/multihandler
sleep 1

sudo ln -s $HOME/autoBSPWM/scripts/penelope.py /usr/local/bin/pen
sleep 1

sudo ln -s $HOME/autoBSPWM/scripts/target.sh /usr/local/bin/target
sleep 1

sudo ln -s $HOME/autoBSPWM/scripts/transfile.sh /usr/local/bin/transfile
sleep 1


alacritty migrate
sleep 1

touch $HOME/.ctf_vars
sleep 1

sudo apt install -y ufw sshpass bat
sleep 1

sudo cp $HOME/autoBSPWM/scripts/proxy /usr/local/bin/proxy
sleep 1

sudo chmod +x /usr/local/bin/proxy
sleep 1

sudo chmod +x $HOME/.config/bspwm/scripts/bspwm_resize
sleep 1
