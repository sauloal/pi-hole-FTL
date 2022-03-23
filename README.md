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

## Reduce writes to DB

```sh
echo -e "\nDBINTERVAL=60\nMAXDBDAYS=30\n" | sudo tee -a /etc/pihole/pihole-FTL.conf
```

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

## Cloudflare

<https://docs.pi-hole.net/guides/dns/cloudflared/>

<https://github.com/cloudflare/cloudflared/releases>

<https://github.com/cloudflare/cloudflared/releases/download/2022.3.3/cloudflared-linux-arm>

```bash
wget https://github.com/cloudflare/cloudflared/releases/download/2022.3.3/cloudflared-linux-arm
sudo mv cloudflared-linux-arm sudo /usr/local/bin/cloudflared
sudo chmod +x /usr/local/bin/cloudflared
cloudflared -h
cloudflared -v
```

### Create service

QUITE SLOW

```bash
sudo useradd -s /usr/sbin/nologin -r -M cloudflared
sudo nano /etc/default/cloudflared
```

```text
# Commandline args for cloudflared, using Cloudflare DNS
CLOUDFLARED_OPTS=--port 5053 --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query
```

or the private DoH addres provided by cloudflare.

```bash
sudo chown cloudflared:cloudflared /etc/default/cloudflared
sudo chown cloudflared:cloudflared /usr/local/bin/cloudflared
sudo nano /etc/systemd/system/cloudflared.service
```

```service
[Unit]
Description=cloudflared DNS over HTTPS proxy
After=syslog.target network-online.target

[Service]
Type=simple
User=cloudflared
EnvironmentFile=/etc/default/cloudflared
ExecStart=/usr/local/bin/cloudflared proxy-dns $CLOUDFLARED_OPTS
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
sudo systemctl status cloudflared

dig @127.0.0.1 -p 5053 google.com
```

### Test

1. Configure Gateway location.
2. Get gateway HTTPS URL.
3. Change URL in `/etc/default/cloudflared`
4. Restart service
5. Test
6. Configure pi-hole

<https://developers.cloudflare.com/cloudflare-one/policies/filtering/dns-policies-builder/check-policy/>

```bash
for CAT in malware phishing cryptomining parkedandforsaledomains privateipaddress commandandcontrolandbotnet anonymizer newdomains privateipaddress spam spyware unreachable; do URL=$CAT.testcategory.com; echo $URL; dig @127.0.0.1 -p 5053 $URL; done
```

