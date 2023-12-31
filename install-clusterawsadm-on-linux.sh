#!/usr/bin/env bash

if grep --silent 'Amazon Linux' <<<"$(grep ^NAME= /etc/os-release)"; then
    brew install clusterawsadm

else
    version=$(curl -s https://api.github.com/repos/kubernetes-sigs/cluster-api-provider-aws/releases/latest | grep tag_name | cut -d '"' -f 4)
    curl -Lo clusterawsadm https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/$version/clusterawsadm-linux-amd64
    chmod +x clusterawsadm
    sudo mv clusterawsadm /usr/local/bin/clusterawsadm
    clusterawsadm version

fi
