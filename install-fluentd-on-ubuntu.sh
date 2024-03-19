#!/usr/bin/env bash

if grep 'VERSION=.*Jammy' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-jammy-fluent-package5.sh
elif grep 'VERSION=.*LTS.*Jammy' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-jammy-fluent-package5-lts.sh
elif grep 'VERSION=.*Bullseye' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-bullseye-fluent-package5.sh
elif grep 'VERSION=.*LTS.*Bullseye' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-bullseye-fluent-package5-lts.sh
elif grep 'VERSION=.*Focal' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-focal-fluent-package5.sh
elif grep 'VERSION=.*LTS.*Focal' /etc/os-release; then
    url=https://toolbelt.treasuredata.com/sh/install-ubuntu-focal-fluent-package5-lts.sh
fi

cmd="curl -fsSL $url | sh"
echo $cmd
eval "DEBIAN_FRONTEND=noninteractive $cmd"
