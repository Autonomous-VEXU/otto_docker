#!/bin/bash
set -e

# Source ROS 2
source /opt/ros/jazzy/setup.bash

# colcon build
colcon build --symlink-install

# Only source workspace if it exists (bind mount will make it available)
if [ -f /ros2_ws/install/setup.bash ]; then
    source /ros2_ws/install/setup.bash
fi

# If no command is passed, open bash
if [ $# -eq 0 ]; then
    exec bash
else
    exec "$@"
fi
