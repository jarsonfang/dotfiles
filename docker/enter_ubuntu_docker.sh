#!/bin/bash

WORK_DIR=`pwd`

docker_image_tag=20.04.1
docker_image_repo="ubuntu"
# docker_image_repo="docker.domain.com:5000/ubuntu"

machine_name=ubuntu-${docker_image_tag}
machine_id=`docker ps -a -q -f name=${machine_name}`

log_highlight() {
    echo -e "\e[30;31m"$1"$(tput sgr0)"
}

if [[ ${machine_id} != '' ]]; then
    log_highlight "Enter docker: ${machine_name}/${machine_id} ..."
    docker start ${machine_id}
    docker exec -it ${machine_id} /bin/bash
else
    docker_addr=${docker_image_repo}:${docker_image_tag}
    # docker pull $docker_addr

    log_highlight "Run docker from ${docker_addr}"

    docker run -it --net=host --privileged --device /dev --name ${machine_name} \
        -v /dev:/dev -v ${WORK_DIR}:/workspace -w /workspace ${docker_addr}
fi

