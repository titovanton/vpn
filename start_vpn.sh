#!/bin/bash

source /home/titovanton/aliases/border.sh

if [ $EUID != 0 ]; then
  border "Please, run this with sudo..."
  exit 1
fi

code=DE
if [ $1 ]; then
  code=$1
fi

cyberghostvpn --country-code $code --traffic --connect

if [ $? != 0 ]; then
  error "cyberghostvpn connection faild"
  exit 2
fi

route_vpn_gateway=$(ip r | grep 0.0.0.0 | cut -d ' ' -f3)

echo "Adding default route to $route_vpn_gateway with /0 mask..."
ip route add default via $route_vpn_gateway

echo "Removing /1 routes..."
ip route del 0.0.0.0/1 via $route_vpn_gateway
ip route del 128.0.0.0/1 via $route_vpn_gateway

success "connected!"
