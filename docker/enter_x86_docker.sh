#!/bin/bash

docker_image_tag="20.04"
docker_image_repo="ubuntu"
docker_image_url=${docker_image_repo}:${docker_image_tag}

machine_name=ubuntu-${docker_image_tag}
machine_id=`docker ps -a -q -f name=${machine_name}`

function log_highlight()
{
    echo -e "\e[30;31m"$1"\e[0m"
}

# sudo apt install x11-xserver-utils
xhost +

if [[ x${machine_id} != x'' ]]; then
    log_highlight "Enter docker: ${machine_name}/${machine_id} ..."
    docker start ${machine_id}
    docker exec -it ${machine_id} /bin/bash
else
    log_highlight "Run docker from ${docker_image_url}"

    WORK_DIR=${PWD}
    docker run --pull=missing -it --privileged --name ${machine_name} \
        -u root --net=host \
        -v /dev:/dev \
        -v ${WORK_DIR}:/workspace -w /workspace \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
        ${docker_image_url}
fi

