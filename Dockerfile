FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && apt-get install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales sudo

# Create a non-root user
RUN useradd -ms /bin/bash yocto-user

# Give the non-root user sudo privileges
RUN echo "yocto-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to the new user
USER yocto-user

# Set the locale
RUN sudo locale-gen en_US.UTF-8

# Set the working directory
WORKDIR /home/yocto-user/src