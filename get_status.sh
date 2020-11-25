source /home/titovanton/aliases/border.sh

STAT=$(cyberghostvpn --status)
IP=$(curl -s ipinfo.io/ip)
border $STAT "Public IP: $IP"
