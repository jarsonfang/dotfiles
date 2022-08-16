#!/bin/bash

# Preparation:
# download qemu-aarch64-static from https://github.com/multiarch/qemu-user-static/releases
# copy qemu-aarch64-static to /usr/bin (give execute permission)

WORK_DIR=`pwd`

docker_image_tag=1.0.0
docker_image_repo="docker.domain.com:5000/xavier-aarch64"

machine_name=aarch64-xavier
machine_id=`docker ps -a -q -f name=${machine_name}`

log_highlight() {
    echo -e "\e[30;31m"$1"$(tput sgr0)"
}

docker run --rm --privileged multiarch/qemu-user-static:register --reset

if [[ ${machine_id} != '' ]]; then
    log_highlight "Enter docker: ${machine_name}/${machine_id} ..."
    docker start ${machine_id}
    docker exec -itu root ${machine_id} /bin/bash
else
    docker_addr=${docker_image_repo}:${docker_image_tag}
    # docker pull $docker_addr

    log_highlight "Run docker from ${docker_addr}"

    docker run -it --net=host --privileged --device /dev --name ${machine_name} \
        -v /dev:/dev -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static \
        -v ${WORK_DIR}:/workspace -w /workspace ${docker_addr}
fi

