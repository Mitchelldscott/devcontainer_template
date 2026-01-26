#!/bin/bash
set -e

# The 'install.sh' script is executed as root in a feature's container.
# It should be used to install and configure the feature.
#
# For more information, see: https://containers.dev/implementors/features#install-sh
echo "Activating feature 'rust'"

export RUSTUP_HOME=/usr/local/rustup
export CARGO_HOME=/usr/local/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo 'source "${CARGO_HOME}/env"' >> ~/.bashrc

source "${CARGO_HOME}/env"

rustup component add clippy rustfmt