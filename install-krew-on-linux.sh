#!/usr/bin/env bash

(
    set -x
    cd "$(mktemp -d)" &&
        OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
        ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
        KREW="krew-${OS}_${ARCH}" &&
        curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
        tar zxvf "${KREW}.tar.gz" &&
        ./"${KREW}" install krew
)

mkdir -p $HOME/.krew/bin
export PATH=$HOME/.krew/bin:$PATH
echo 'export PATH=$HOME/.krew/bin:$PATH' >>~/.profile
echo $KREW_ROOT
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
