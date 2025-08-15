#!/usr/bin/env bash

# Install k9s
if ! which k9s; then
  wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb &&
    sudo apt install ./k9s_linux_amd64.deb &&
    rm k9s_linux_amd64.deb
else
  echo "k9s is installed."
fi

# Install GO
if ! which go; then
  wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz &&
    sudo rm -rf /usr/local/go &&
    sudo tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz &&
    rm -rf go1.25.0.linux-amd64.tar.gz
else
  echo "GO is installed."
fi
