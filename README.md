# dde4aros
**dde4aros** stands for **d**ocker **D**evelopment **E**nvironment for **AROS**. Using this docker image you are able to compile AROS from sources on any system where docker is installed.

## Usage

If you don't have docker installed on your system, you better install it, so to use this image.
* [Windows](https://docs.docker.com/docker-for-windows/install/)
* [Mac](https://docs.docker.com/docker-for-mac/install/)
* [Linux](https://docs.docker.com/install/)


### Run docker image
To create a container with the **dde4aros** docker image, so that you are able to compile your projects for AROS, execute the following command inside your terminal.
```bash
cd your-apps-folder

docker run -it --rm --name dde4aros -v "$PWD":/usr/src -w /usr/src walkero/dde4aros:latest
```
When you use the above command you will get into the docker Development Environment for AROS. So you will see in your terminal something like:
```bash
root@a1abef0bbe0a:/usr/src#
```

### Update docker image
To update your docker image to the latest version, execute the following inside your terminal.
```bash
docker pull walkero/dde4aros:latest
```

## Build AROS
Let's build AROS on this Development Environment. I assume that you have GIT and and IDE installed on your system.

1. Create a folder where you are going to keep all your sources.
1. Open a terminal and go into that directory
1. Now, clone from github AROS sources
    ```bash
    git clone https://github.com/aros-development-team/AROS.git
    ```
1. Run the docker image, as it is shown above
1. Do the following to compile AROS
    ```bash
    cd AROS
    ./configure --target=pc-x86_64 --enable-ccache --with-gcc-version=9.1.0 --with-binutils-version=2.32 --with-portssources=/usr/src/AROS
    make -j 2 && make -j 2 distfiles
    ```
    The above will compile AROS and create a distribution ISO. If you need to rebuild it after some changes, do:
    ```bash
    make -j 2 bootiso-quick
    ```
1. To get out the docker container just type `exit` and press enter.
1. When you exit the container is deleted, but NOT your code, as they remain in the host machine.
1. To get back in, just use the docker command from step 4

## Benefits
There are a lot of benefits of such a solution, for a development environment to work on AROS or your very own projects:
* Small footprint of the Development Environment
* docker images can be updated. The developers can use the `latest` TAG to get the latest version, or specific version TAG, to stick on a specific version
* The codes are shared between the host computer and the docker container
* Use any tools you like for development on the host computer (Version Control Systems, IDE etc.)
* Development Environment isolation

## Available tags
* latest
* 1.0

### Credits
This docker image installation is based on http://vmwaros.blogspot.com/2019/09/setting-up-64bit-linux-development-env.html by Paolo Besser