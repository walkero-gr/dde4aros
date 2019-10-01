FROM debian:buster-slim

LABEL maintainer="Georgios Sokianos <walkero@gmail.com>"

RUN apt-get -y update && apt-get -y upgrade; \
    apt-get -y install apt-utils \
        wget \
        lhasa \
        git \
        subversion \
        mercurial;

RUN apt-get install -y --no-install-recommends \
    libpng-dev \
    zlib1g-dev \
    libxcursor-dev \
    libgl1-mesa-dev \
    libasound2-dev \
    gawk bison flex netpbm automake cmake genisoimage sshpass \
    python-mako libswitch-perl gperf gcc-multilib g++ ccache make;
