#!/bin/bash
set -e

echo "Activating feature 'julia' (Global Install)"

export JULIAUP_DEPOT_PATH="/opt/juliaup"

curl -fsSL https://install.julialang.org | sh -s -- -y

echo 'export PATH=$PATH:/opt/juliaup/bin' > /etc/profile.d/juliaup.sh
chmod +x /etc/profile.d/juliaup.sh

chmod -R 777 "/opt/juliaup"

rm -rf /tmp/julia_install