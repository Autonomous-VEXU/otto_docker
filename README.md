# otto_docker
A Ubuntu 24.04 docker container that has ROS 2 Jazzy.
#### Current Submodules:
- `otto_hardware`
- `otto_bringup`
- `otto_description`

## Building the Container
`docker build -t otto_docker:latest . ` <-- the dot is important!

## Running the Container
`docker run -it --runtime nvidia otto_docker`
