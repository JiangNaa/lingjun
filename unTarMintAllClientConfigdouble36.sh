#!/bin/bash

# 删除 .config 目录
rm -rf ~/ceremonyclient/client/.config

# 获取本机 IP 地址
IP_ADDRESS=$(curl -s cip.cc | grep -oP 'IP\s+:\s+\K(\d+\.\d+\.\d+\.\d+)')

# 查找与本机 IP 匹配的 tar 包
TAR_FILE=~/"${IP_ADDRESS}".tar.gz

# 检查是否找到相应的 tar 包
if [ -f "$TAR_FILE" ]; then
    # 解压缩 tar 包
    tar -xzvf "$TAR_FILE" -C ~/ceremonyclient/client && \
    cd ~/ceremonyclient/client/.config && \
    sed -i 's|listenGrpcMultiaddr: "/ip4/127.0.0.1/tcp/8337"|listenGrpcMultiaddr: ""|' config.yml && 
\
    sed -i 's|listenRESTMultiaddr: "/ip4/127.0.0.1/tcp/8338"|listenRESTMultiaddr: ""|' config.yml && 
\
    cd ~/ceremonyclient/client && \
    ./qclient-2.0.2.3-linux-amd64 token mint all --config ./.config
else
    echo "未找到与本机 IP 地址 ${IP_ADDRESS} 匹配的 tar 包。"
fi