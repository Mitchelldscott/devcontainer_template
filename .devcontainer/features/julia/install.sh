#!/bin/bash
set -e

# The 'install.sh' script is executed as root in a feature's container.
# It should be used to install and configure the feature.
#
# For more information, see: https://containers.dev/implementors/features#install-sh
echo "Activating feature 'julia'"

curl -fsSL https://install.julialang.org | sh -s -- -y

echo 'export PATH="${HOME}/.juliaup/bin:${PATH}"' >> ~/.bashrc

if [[ -f Project.toml ]]; then
    echo "Detected 'Project.toml', installing dependencies"
    ${HOME}/.juliaup/bin --project=. -e 'using Pkg; Pkg.instantiate()'
fi
