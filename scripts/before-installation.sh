#!/bin/bash
echo "-----------------------------"
echo "Starting: Before Installation"
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

info "Check if /data directory exist, if not, create the directory"
mkdir -p /data

info "Check if /data/www directory exist, if not, create the directory"
mkdir -p /data/www

info "Check if /data/www/exmaple.com directory exist, if not, create the directory"
mkdir -p /data/www/example.com

info "Check if /data/www/example.com/public_html directory exist, if not, create the directory"
mkdir -p /data/www/example.com/public_html

info "Installing npm and node"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

