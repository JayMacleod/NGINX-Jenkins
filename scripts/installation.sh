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
    rm -rf /data/www/example.com/public_html/index.html
fi

info "Copying index.html directory to /data/www"
cp index.html /data/www/example.com/public_html/index.html

if [[ -f "/etc/nginx/nginx.conf" ]]; then
    info "NGINX Conf Already Exist"
    warn "Removing Old NGINX Conf file"
    rm -rf /etc/nginx/nginx.conf
fi

info "Copying nginx.conf directory to /etc/nginx"
cp ./provision/NGINX/nginx.conf /etc/nginx

if [[ -f "/etc/nginx/sites-available/example.com" ]]; then
    info " Example.com Already Exist"
    warn "Removing Old Example.com file from sites-available"
    rm -rf /etc/nginx/sites-available/exmaple.com
fi

info "Copying example.com to /etc/nginx/sites-available/"
cp ./provision/NGINX/example.com /etc/nginx/sites-available/

