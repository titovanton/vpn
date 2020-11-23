#!/bin/bash

source /home/titovanton/aliases/border.sh

if [ $EUID != 0 ]; then
  border "Please, run this with sudo..."
  exit 1
fi

cyberghostvpn --stop

if [ $? != 0 ]; then
  error "cyberghostvpn --stop faild"
  exit 1
fi

success "disconnected."
