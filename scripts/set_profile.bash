#!/bin/bash

# Set the USER_UID and USER_GID in .devcontainer/.env to the current user's UID and GID
sed -i "s/^USER_UID=.*/USER_UID=$(id -u)/" .devcontainer/.env
sed -i "s/^USER_GID=.*/USER_GID=$(id -g)/" .devcontainer/.env
sed -i "s/^USERNAME=.*/USERNAME=$(id -un)/" .devcontainer/.env