FROM debian:latest

# Đảm bảo sử dụng quyền root
USER root

RUN mkdir -p /var/lib/apt/lists/partial && \
    chmod -R 755 /var/lib/apt/lists && \
    apt update && \
    apt install -y git && \
    echo "Cài đặt Git thành công!" && \
    rm -rf /var/lib/apt/lists/*
