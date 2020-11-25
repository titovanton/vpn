source /home/titovanton/aliases/border.sh

STAT=$(cyberghostvpn --status)
border $STAT

IP=$(curl ipinfo.io/ip)
border $IP
