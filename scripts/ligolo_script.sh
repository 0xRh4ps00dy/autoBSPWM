
#!/bin/bash

vpn=$(ip addr | grep tun0 | grep inet | awk '{print $2}' | cut -d "/" -f 1)

sudo ip tuntap add user $(whoami) mode tun ligolo
sudo ip link set ligolo up

echo '#Proxy'
echo 'proxy -laddr $kali:9001 -selfcert'
echo ""
echo "# Windows Command"
echo ".\ligolo.exe -connect $vpn:9001 -ignore-cert"
echo ""
echo "# Linux Command"
echo "./ligolo -connect $vpn:9001 -ignore-cert"
echo ""
echo ""
echo "# In Ligolo-ng console"
echo ""
echo "session #select host"
echo "ifconfig #Notedown the internal network's subnet"
echo "start #after adding relevent subnet to ligolo interface"
echo ""
echo ""
echo "# Adding subnet to ligolo interface - Kali linux"
echo ""
echo "sudo ip r add <subnet> dev ligolo"
echo ""

echo "sudo ip r add <subnet> dev ligolo"| xclip -sel clip


cd ~/Tools

./proxy -laddr $vpn:9001 -selfcert
