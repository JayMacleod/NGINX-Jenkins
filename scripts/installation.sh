#!/bin/bash
echo "-----------------------------"
echo "Starting: Installation"
echo "-----------------------------"

DEBUG=true

debug() {
  if [[ "$DEBUG" == "true" ]]; then
    echo -e "PRE: [DEBUG] $*"
  fi
}

info() {
  echo -e "PRE: [INFO] $*"
}

warn() {
  echo -e "PRE: [WARN] $*"
}

fatal() {
  echo -e "PRE: [FATAL] $*"
}

if [[ -f "/data/www/index.html" ]]; then
    info "Index.html Already Exist"
    warn "Removing Old Index.html"
    rm -rf /data/www/index.html
fi

cp index.html /data/www/

if [[ -f "/etc/nginx/nginx.conf" ]]; then
    info "NGINX Conf Already Exist"
    warn "Removing Old NGINX Conf file"
    rm -rf /etc/nginx/nginx.conf
fi

cp ./provision/NGINX/nginx.conf /etc/nginx



