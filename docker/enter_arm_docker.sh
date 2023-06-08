#!/bin/bash

# Preparation:
# download qemu-aarch64-static from https://github.com/multiarch/qemu-user-static/releases
# copy qemu-aarch64-static to /usr/bin (give execute permission)
#
# docker pull --platform=linux/aarch64 ubuntu:18.04
# docker pull multiarch/qemu-user-static:register

docker_image_tag="18.04"
docker_image_repo="ubuntu"

machine_name=ubuntu-aarch64-${docker_image_tag}
machine_id=`docker ps -a -q -f name=${machine_name}`

log_highlight() {
    echo -e "\e[30;31m"$1"$(tput sgr0)"
}

# sudo apt install x11-xserver-utils
xhost +

docker run --rm --privileged multiarch/qemu-user-static:register --reset

if [[ ${machine_id} != '' ]]; then
    log_highlight "Enter docker: ${machine_name}/${machine_id} ..."
    docker start ${machine_id}
    docker exec -itu root ${machine_id} /bin/bash
else
    WORK_DIR=`pwd`
    docker_image_url=${docker_image_repo}:${docker_image_tag}

    log_highlight "Run docker from ${docker_image_url}"

    docker run -it --privileged --name ${machine_name} --net=host \
        -v /dev:/dev \
        -v ${WORK_DIR}:/workspace -w /workspace \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static \
        ${docker_image_url}
fi

