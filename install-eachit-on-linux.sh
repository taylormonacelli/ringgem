#!/usr/bin/env bash

url=https://github.com/taylormonacelli/eachit/releases/latest/download/eachit_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/eachit/releases/latest/download/checksums.txt

pushd=$(mktemp -d /tmp/eachit-XXXX)
cd $dir

curl --fail --silent --show-error --location --output eachit_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if sha256sum --check checksums.txt --ignore-missing; then
    tar --extract --gzip --file eachit_Linux_x86_64.tar.gz eachit
    install --mode 0755 eachit /usr/local/bin/eachit
else
    echo "Checksum validation failed"
    exit 1
fi

popd
rm -rf $dir
eachit --help
