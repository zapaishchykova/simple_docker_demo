#cd docker && docker build -t itmt -f Dockerfile . 
#docker run --gpus all -it itmt
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y tzdata

RUN apt update && \
    apt install --no-install-recommends -y build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install --no-install-recommends -y python3.9 python3-pip python3-setuptools python3-distutils && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN python3.9 -m pip install --upgrade pip 

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN pip3 install --no-cache-dir  tensorflow==2.10 nilearn pandas numpy matplotlib nibabel opencv-python  

RUN python3.9 -c "import tensorflow"

COPY data data/
COPY main.py /
CMD [ "python3.9", "./main.py" ]