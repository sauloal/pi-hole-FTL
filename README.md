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
