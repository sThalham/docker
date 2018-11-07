# tensorflow
FROM tensorflow/tensorflow:latest-gpu-py3

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

RUN pip3 install --upgrade pip

# install Keras
RUN pip3 install keras==2.2.0

RUN pip3 install opencv-python
RUN pip3 install pathlib

# manually update numpy
RUN pip3 --no-cache-dir install -U numpy==1.13.3

# Clone the Detectron repository
RUN git clone https://github.com/sThalham/pix2pixmod.git /pix2pix

# Install Python dependencies
RUN pip3 install -r /pix2pix/requirements.txt

# Go to pix2pix root
WORKDIR /pix2pix

#CMD ["python3", "pix2pix.py"]
