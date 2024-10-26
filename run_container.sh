#!/bin/bash

# Tên image và container
IMAGE_NAME="my_image"
CONTAINER_NAME="my_container"

# Tham số tùy chọn
DOCKER_PORT="8080:80"           # Map cổng
ENV_VAR="MY_VAR=value"          # Biến môi trường
VOLUME_MOUNT="/host/path:/container/path" # Volume mount
NETWORK_NAME="my_network"       # Tên mạng
MEMORY_LIMIT="512m"             # Giới hạn bộ nhớ
CPU_LIMIT="1.5"                 # Giới hạn CPU

# Chạy lệnh docker run với tất cả các option
docker run -d \
    --name $CONTAINER_NAME \
    -p $DOCKER_PORT \
    -e $ENV_VAR \
    -v $VOLUME_MOUNT \
    --network $NETWORK_NAME \
    --rm \
    --memory $MEMORY_LIMIT \
    --cpus $CPU_LIMIT \
    --privileged \
    --workdir /app \
    --user $(id -u):$(id -g) \
    --restart always \
    --dns 8.8.8.8 \
    --gpus all \
    --entrypoint "/bin/bash" \
    $IMAGE_NAME

# Kiểm tra nếu container đang chạy
if [ $? -eq 0 ]; then
    echo "Container '$CONTAINER_NAME' is running successfully!"
else
    echo "Failed to run the container '$CONTAINER_NAME'."
fi
