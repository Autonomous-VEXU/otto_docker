# otto_docker
A Ubuntu 24.04 docker container that has ROS 2 Jazzy.
#### Current Submodules:
- `otto_hardware`
- `otto_bringup`
- `otto_description`
- `otto_navigation`
- `ros_colorsens_apds9960`
- `ros_fuelgauge_max17263`
- `ros_imu_lsm6dsv16x`

## Container Commands
#### Building the container:
`docker build -t otto_docker:latest . ` <-- the dot is important!

#### Running the Container:
`docker run -it --runtime=nvidia --net=host --ipc=host otto_docker`

## Multi-user git + GitHub Configuration
I automated switching git + GitHub configuration files, ssh keys, and more. Here is how you get setup:

### 1.) Create SSH key:
Each user needs a different SSH key to use. Here is how to set one up:

**Setting up an SSH Key:**
- first generate the key using the command: `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
- when prompted to, make sure you save it to the file path :`~/.ssh/<your_firstname>_ssh` (your firstname should be all lowercase!)
- start the ssh agent with `eval "$(ssh-agent -s)"` 
- add the key to the agent `ssh-add ~/.ssh/<your_firstname>_ssh
- view your key by running `cat ~/.ssh/<your_firstname>_ssh`
- Copy your key and add it to GitHub

### 2.) Edit your git config file:
Within the hidden directory `~/.gitconfigs` there are multiple files. Your file's name will follow the format `.gitconfig_<initials>`. 
You only have to fill out the rest of the fields that are commented out.
Here is an example for reference:
```
[user]
	name = My Name
	email = myname@email.com

[core]
	sshCommand = ssh -i ~/.ssh/my_ssh
```
### 3.) Using the "CLI" Tool
Checking the current user: `git-whoami` </br>
Switching to a different user: `git-user-switch "firstname"`
