FROM nvidia/cuda:11.2.2-cudnn8-runtime-ubuntu20.04

# Set timezone
RUN ln -snf /usr/share/zoneinfo/US/Eastern /etc/localtime && echo US/Eastern > /etc/timezone

# Install dependencies
RUN apt update && apt install -y \
    tzdata \
    build-essential \
    software-properties-common \
    python3.9 \
    python3-pip \
    ffmpeg \
    libsm6 \
    libxext6

# Upgrade pip
RUN python3.9 -m pip install --upgrade pip

# Install compatible NumPy version and TensorFlow
RUN pip3 install --no-cache-dir "numpy<2"
RUN pip3 install --no-cache-dir tensorflow==2.10 nilearn pandas matplotlib nibabel opencv-python

# Test TensorFlow installation
RUN python3.9 -c "import tensorflow as tf; print(f'TensorFlow Version: {tf.__version__}')"


COPY data data/
COPY main.py /
CMD [ "python3.9", "./main.py" ]
