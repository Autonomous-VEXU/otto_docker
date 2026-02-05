FROM ros:jazzy-perception-noble

SHELL ["/bin/bash", "-c"]

# Install required ROS and system packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    ros-jazzy-sick-scan-xd \
    ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup \
    ros-jazzy-ros2-control \
    ros-jazzy-ros2-controllers \
    ros-jazzy-gz-ros2-control \
    ros-jazzy-rmw-cyclonedds-cpp \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /ros2_ws

# Copy the source code into the image
COPY ros2_ws /ros2_ws

# Entry point will handle sourcing ROS and workspace
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# change DDS middleware
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# ROS Domain ID to match my laptop :)
ENV ROS_DOMAIN_ID=30

# Use entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Default command: open bash
CMD ["bash"]
