# pi-hole-FTL

##  db2dump.sh

Dump database to files.

```sh
bash db2dump.sh
```

## db2hosts.sh

Dump manullay generated list of blocked host to `hosts` file to be added to gravity.

```sh
bash db2hosts.sh
```

## Update

```sh
pihole -up
```

## Fix Rate Limit

```sh
echo -e "\nRATE_LIMIT=0/0\n" | sudo tee -a /etc/pihole/pihole-FTL.conf
````

## Install

```sh
sudo apt clean all
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo reboot now

sudo apt clean all
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt-get full-upgrade
sudo apt-get dist-upgrade

wget -O basic-install.sh https://install.pi-hole.net
sudo bash basic-install.sh
pihole
pihole -a -p
pihole -c
pihole -a -e sauloal@gmail.com

ssh-keygen -b 4096
cat ~/.ssh/id_rsa.pub

git clone git@github.com:sauloal/pi-hole-FTL.git
```

## UFW

```sh
sudo apt install ufw

sudo ufw allow ssh
sudo ufw allow dns
sudo ufw allow bootps
sudo ufw allow http
sudo ufw enable
sudo ufw status numbered
```

## log2ram

```sh
git clone https://github.com/azlux/log2ram
cd log2ram
chmod +x install.sh && sudo ./install.sh
sudo nano /etc/log2ram.conf
```

`cat /etc/log2ram.conf  | grep -v "#"`

```ini

SIZE=100M
MAIL=false
PATH_DISK="/var/log"
ZL2R=true
COMP_ALG=lz4
LOG_DISK_SIZE=400M
```

## Swap

```sh
sudo swapoff --all

sudo apt-get remove dphys-swapfile

sudo apt-get autoremove
```
