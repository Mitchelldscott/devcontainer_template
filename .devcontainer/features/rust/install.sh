#!/bin/bash
set -e

echo "Activating feature 'rust' (Global Install)"

export RUSTUP_HOME=/usr/local/rustup
export CARGO_HOME=/usr/local/cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

source "${CARGO_HOME}/env"
rustup component add clippy rustfmt

echo 'export RUSTUP_HOME=${RUSTUP_HOME}' >> /etc/profile.d/rust.sh
echo 'export CARGO_HOME=${CARGO_HOME}' >> /etc/profile.d/rust.sh
echo 'export PATH=\${CARGO_HOME}/bin:\${PATH}' >> /etc/profile.d/rust.sh
chmod +x /etc/profile.d/rust.sh

chmod -R a+rwX "${RUSTUP_HOME}"
chmod -R a+rwX "${CARGO_HOME}"

echo "Rust installation complete."