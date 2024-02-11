#Con este script lo que hacemos es poner el bit de forward a 1, por lo que así tendríamos Internet
#En este caso ens18 es el nombre de la tarjeta de red en el servidor.

#!/bin/bash
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 193.168.3.0 -o ens18 -j MASQUERADE
iptables -A FORWARD -j ACCEPT

#Se le da permisos
chmod +x enruta.sh
#Se ejecuta
bash enruta.sh
#En el (CLIENTE) se hace ping y debe de funcionar
ping 8.8.8.8












