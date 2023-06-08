#!/bin/bash

docker_image_tag="20.04"
docker_image_repo="ubuntu"

machine_name=ubuntu-${docker_image_tag}
machine_id=`docker ps -a -q -f name=${machine_name}`

log_highlight() {
    echo -e "\e[30;31m"$1"$(tput sgr0)"
}

# sudo apt install x11-xserver-utils
xhost +

if [[ ${machine_id} != '' ]]; then
    log_highlight "Enter docker: ${machine_name}/${machine_id} ..."
    docker start ${machine_id}
    docker exec -it ${machine_id} /bin/bash
else
    WORK_DIR=`pwd`
    docker_image_url=${docker_image_repo}:${docker_image_tag}

    log_highlight "Run docker from ${docker_image_url}"

    docker run --pull=missing -it --privileged --name ${machine_name} --net=host \
        -v /dev:/dev \
        -v ${WORK_DIR}:/workspace -w /workspace \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        ${docker_image_url}
fi

