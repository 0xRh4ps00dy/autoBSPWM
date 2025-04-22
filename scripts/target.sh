#!/bin/bash

# Add this to .zshrc
# if [ -f /home/rh4ps00dy/.ctf_vars ]; then
# . /home/rh4ps00dy/.ctf_vars
# fi

# Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Reset file

rm $HOME/.ctf_vars
touch $HOME/.ctf_vars
echo ""
echo -e "${RED}Variables file reseted${NC}"
echo ""

# VPN Connection

read -p "Is the VPN active? (y/n)" vpn_active
echo ""

while [ $vpn_active = 'n' ]; do
    nmcli con show
    echo ""
    read -p "Enter the VPN Connection: " vpnName
    nmcli con up $vpnName
    echo ""
    break
done

# Create variables

tun0=$(ip addr | grep tun0 | grep inet | awk '{print $2}' | cut -d "/" -f 1)
read -p "Enter the IP of the target: " target

ipvalid() {
  # Set up local variables
  local ip=${1:-NO_IP_PROVIDED}
  local IFS=.; local -a a=($ip)
  # Start with a regex format test
  [[ $ip =~ ^[0-9]+(\.[0-9]+){3}$ ]] || return 1
  # Test values of quads
  local quad
  for quad in {0..3}; do
    [[ "${a[$quad]}" -gt 255 ]] && return 1
  done
  return 0
}

while ! ipvalid "$target"; do
  echo ""
  echo -e "${YELLOW}Incorrect IP ($target)${NC}"
  echo ""
  read -p "Enter the IP of the target: " target
done


read -p "Enter the name of the box: " boxName
echo ""
boxPath=$HOME/Desktop/$boxName

# Create .ctf_vars file

echo "#addresses" >> $HOME/.ctf_vars
echo "target="$target >> $HOME/.ctf_vars
echo "tun0="$(/usr/sbin/ifconfig tun0 | grep "inet " | cut -d " " -f 10) >> $HOME/.ctf_vars
echo "" >> $HOME/.ctf_vars

echo "#files" >> $HOME/.ctf_vars
echo "boxName="$boxName >> $HOME/.ctf_vars
echo "boxPath=/home/rh4ps00dy/Desktop/"$boxName >> $HOME/.ctf_vars
echo "" >> $HOME/.ctf_vars

echo "#aliases" >> $HOME/.ctf_vars
echo "alias cdb='cd $boxPath'" >> $HOME/.ctf_vars
echo "alias content='$boxPath/content'" >> $HOME/.ctf_vars
echo "alias exploits='$boxPath/exploits'" >> $HOME/.ctf_vars
echo "alias scans='$boxPath/scans'" >> $HOME/.ctf_vars

echo -e "${RED}Variables file created${NC}"
echo "" 

# Firewall
sudo ufw status numbered
sudo ufw delete 1
sudo ufw allow from $target
sudo ufw status verbose
echo "" 
echo -e "${RED}Firewall configurated${NC}"
echo "" 

# Create folders

if [ -d $HOME/Desktop/$boxName ]; then
  echo -e "${RED}Directory exists${NC}"
  echo ""
else
  mkdir $HOME/Desktop/$boxName
  mkdir $HOME/Desktop/$boxName/content
  mkdir $HOME/Desktop/$boxName/exploits
  mkdir $HOME/Desktop/$boxName/scans
  touch $HOME/Desktop/$boxName/$boxName-Notes.txt
  echo -e "${RED}Directory created${NC}"
  echo ""
fi

# Print all variables file
echo "Print varibles"
cat $HOME/.ctf_vars
echo -e ""
echo -e "${RED}READY!${NC}"
echo ""

exec /bin/zsh
