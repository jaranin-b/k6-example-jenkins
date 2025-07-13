#!/bin/bash
set -ex

apt-get update
apt-get install -y dirmngr gnupg gnupg2 ca-certificates curl --install-recommends
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
curl -s https://dl.k6.io/key.gpg | apt-key add -
echo "deb https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list
apt-get update
apt-get install -y k6
