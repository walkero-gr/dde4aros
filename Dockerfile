FROM debian:buster-slim

LABEL maintainer="Georgios Sokianos <walkero@gmail.com>"

RUN apt-get -y update && apt-get -y upgrade; \
    apt-get -y install apt-utils;

RUN apt-get install -y --no-install-recommends \
    wget \
    lhasa \
    git subversion mercurial \
    libpng-dev zlib1g-dev libxcursor-dev libgl1-mesa-dev libasound2-dev \
    gawk bison flex netpbm automake cmake genisoimage sshpass \
    python-mako libswitch-perl gperf gcc-multilib g++ \
    ccache make mmake patch bzip2 ca-certificates xz-utils \
    autoconf libx11-dev libxext-dev libc6-dev liblzo2-dev libxxf86vm-dev libsdl1.2-dev byacc; \
    ln -s /usr/bin/genisoimage /usr/bin/mkisofs; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
