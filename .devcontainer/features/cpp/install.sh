#!/bin/bash
set -e

# The 'install.sh' script is executed as root in a feature's container.
# It should be used to install and configure the feature.
#
# For more information, see: https://containers.dev/implementors/features#install-sh
echo "Activating feature 'cpp'"

apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    ninja-build \
    gdb \
    clang \
    clang-format \
    clang-tidy \
    lldb \
    ccache

rm -rf /var/lib/apt/lists/*