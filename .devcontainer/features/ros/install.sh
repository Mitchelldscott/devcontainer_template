#!/bin/bash
set -e

# The 'install.sh' script is executed as root in a feature's container.
# It should be used to install and configure the feature.
#
# For more information, see: https://containers.dev/implementors/features#install-sh
echo "Activating feature 'ros'"

apt-get update && apt-get install -y curl gnupg lsb-release software-properties-common

# Add ROS 2 GPG key and repository
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list

apt-get update

# Install ROS 2 Jazzy Base and Build Tools
apt-get install -y --no-install-recommends \
    ros-jazzy-ros-base \
    ros-dev-tools \
    python3-colcon-common-extensions \
    python3-rosdep

# Initialize rosdep
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    rosdep init
fi
rosdep update

# Source ROS setup in global bashrc
echo "source /opt/ros/jazzy/setup.bash" >> /etc/bash.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /etc/bash.bashrc

rm -rf /var/lib/apt/lists/*