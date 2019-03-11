# tensorflow
#FROM tensorflow/tensorflow:latest-gpu-py3
FROM tensorflow/tensorflow:1.9.0-gpu-py3

RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    g++ \
    git \
    openssh-client \
    # install python 3
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    python3-wheel \
    pkg-config \
    # requirements for numpy
    libopenblas-base \
    python3-numpy \
    python3-scipy \
    # requirements for keras
    python3-h5py \
    python3-yaml \
    python3-pydot \
    python3-tk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# install Keras
RUN pip3 install keras
RUN pip3 install opencv-python
RUN pip3 install progressbar2
RUN pip3 install keras-resnet
RUN pip3 install cython
RUN pip3 install pycocotools
RUN pip3 install pillow
RUN python3 -m pip install matplotlib

RUN git clone https://github.com/sThalham/EagleEye.git /eagleeye

# Go to pix2pix root
WORKDIR /eagleeye

#CMD ["python3", "RetinaNetPose/bin/train.py", "linemod", "data/linemod_3Dboxes"]
