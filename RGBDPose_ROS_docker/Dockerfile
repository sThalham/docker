# tensorflow
#FROM tensorflow/tensorflow:latest-gpu-py3
FROM tensorflow/tensorflow:1.9.0-gpu-py3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq  && apt-get install --no-install-recommends -y \
    build-essential \
    g++ \
    git \
    openssh-client \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    python3-wheel \
    pkg-config \
    libopenblas-base \
    python3-numpy \
    python3-scipy \
    python3-h5py \
    python3-yaml \
    python3-pydot \
    python3-tk \
    tmux \
    vim \
    autoconf \
    automake \
    git \
    wget \
    usbutils \
    unzip \
    software-properties-common \
    libxext-dev \
    libxrender-dev \
    libxslt1.1 \
    libxtst-dev \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    libgl1-mesa-glx\
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    python-rosdep \
    python-vcstools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# install Keras
RUN pip3 install keras==2.2.5
RUN pip3 install opencv-python==3.4.0.14
RUN pip3 install progressbar2
RUN pip3 install keras-resnet
RUN pip3 install cython
RUN pip3 install pycocotools
RUN pip3 install pillow
RUN python3 -m pip install matplotlib
RUN pip3 install transforms3d
RUN pip3 install pyquaternion
RUN pip3 install Geometry
RUN pip3 install glumpy
RUN pip3 install open3d-python
RUN pip3 install pygeometry
RUN pip3 install PyOpenGL

# ROS
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-get update && apt-get install --no-install-recommends -y --allow-unauthenticated \
      ros-kinetic-desktop-full\
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# catkin tools
RUN apt-get update && apt-get install --no-install-recommends -y --allow-unauthenticated \
     python-catkin-tools \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
    rosdep update

# install python packages
RUN pip install --upgrade pip setuptools
RUN pip3 install --upgrade rospkg catkin_pkg opencv-contrib-python empy

# for ros environments
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

# Prepare catkin build
RUN mkdir -p ~/catkin_build_ws/src

# ROS-opencv
#RUN /bin/bash -c 'cd ~/catkin_build_ws/src; git clone -b melodic https://github.com/ros-perception/vision_opencv.git'

# Detector ROS messages
RUN /bin/bash -c 'cd ~/catkin_build_ws/src; git clone http://gitlab+deploy-token-26:X91Kzy7k1oCpZyWa1LzD@rgit.acin.tuwien.ac.at/msuchi/object_detector_msgs.git'

# source the catkin workspace
RUN echo "source ~/catkin_build_ws/devel/setup.bash" >> ~/.bashrc

RUN git clone https://github.com/sThalham/RGBDPose.git /RGBDPose

#RUN /bin/bash -c 'cd ~/catkin_build_ws; cp -r /RGBDPose/RGBDPose_ROS_wrapper ~/catkin_build_ws/src/.; catkin_build'

# Run catkin build
RUN /bin/bash -c  '. /opt/ros/kinetic/setup.bash; cd ~/catkin_build_ws; catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so; catkin build'

#WORKDIR /RGBDPose
WORKDIR /root

# setup entrypoint
#COPY ./ros_entrypoint.sh /
#ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

