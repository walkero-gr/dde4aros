# dde4aros
**dde4aros** stands for **d**ocker **D**evelopment **E**nvironment for **AROS**. Using this docker image you are able to compile AROS from sources on any system where docker is intalled.

## Usage

If you don't have docker installed on your system, you better install it, so to use this image.
* [Windows](https://docs.docker.com/docker-for-windows/install/)
* [Mac](https://docs.docker.com/docker-for-mac/install/)
* [Linux](https://docs.docker.com/install/)

### Build AROS
Let's build AROS on this Development Environment. I assume that you have GIT and and IDE installed on your system.

1. Create a folder where you are going to keep all your sources.
2. Open a terminal and go into that directory
3. Now, clone from github AROS sources
    ```bash
    git clone https://github.com/aros-development-team/AROS.git
    ```
4. After a while the AROS sources will be in your folder under a new directory. Now it's time to start a container to build the sources.
    ```bash
    docker run -it --rm --name dde4aros -v "$PWD":/usr/src -w /usr/src walkero/dde4aros:latest
    ```
5. When you use the above command you will get into the docker Development Environment for AROS. So you will see in your terminal something like:
    ```bash
    root@a1abef0bbe0a:/usr/src#
    ```
6. Do the following to compile AROS
    ```bash
    cd AROS
    ./configure --target=pc-x86_64 --enable-ccache --with-gcc-version=9.1.0 --with-binutils-version=2.32 --with-portssources=/usr/src/AROS
    make -j 2 && make -j 2 distfiles
    ```
    The above will compile AROS and create a distribution ISO. If you need to rebuild it after some changes, do:
    ```bash
    make -j 2 bootiso-quick
    ```
7. To get out the docker container just type `exit` and press enter.
8. When you exit the container is deleted, but NOT your code, as they remain in the host machine.
9. To get back in, just use the docker command from step 4

## Benefits
The benefits of this solution for working on AROS development or your own applications:
* Small footprint of the Development Environment
* docker images can be updated. The developers can use the `latest` TAG to get always the latest version, or specific version TAG, to stick on a specific version
* The codes are shared between the host computer and the docker container
* Use any tools you like for development on the host computer (Version Control Systems, IDE etc.)
* Development Environment isolation

## Available tags
* latest
* 1.0