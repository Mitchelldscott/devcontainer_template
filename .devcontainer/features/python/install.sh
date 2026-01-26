#!/bin/bash
set -e

# The 'install.sh' script is executed as root in a feature's container.
# It should be used to install and configure the feature.
#
# For more information, see: https://containers.dev/implementors/features#install-sh
echo "Activating feature 'python'"

apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    python3-setuptools \
    python3-wheel

rm -rf /var/lib/apt/lists/*

python3 -m venv ${PROJECT_NAME}_pyenv

if [[ -f requirements.txt ]]; then
    echo "Detected 'requirements.txt', installing dependencies"
    source ${PROJECT_NAME}_pyenv/bin/activate
    pip install -r requirements.txt
fi
