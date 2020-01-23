FROM osrf/ros:melodic-desktop-bionic

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Force ROS Python version
ENV ROS_PYTHON_VERSION=3

# Update ros
RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/

# Install tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    htop \
    curl \
    wget \
    nano \
    vim \
    gosu \
    binutils \
    #
    # Install latex
    texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    #
    # Install C++ tools
    build-essential clang-9 cmake cppcheck gdb valgrind \
    #
    # Project dependencies
    libomp-dev \
    #
    # Install Python stuff
    python3.7 \
    python3.7-dev \
    python3-pip \
    python3-tk \
    dvipng \
    && rm -rf /var/lib/apt/lists/ \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1

