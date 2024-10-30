#!/bin/bash

# 切换到指定目录
cd ~/ceremonyclient/client/

# 执行第一个命令并提取账户地址
output=$(./qclient-2.0.2.3-linux-amd64 token balance --config ./.config)
echo "$output"

# 提取地址
address=$(echo "$output" | grep -o '0x[a-zA-Z0-9]*')
echo "提取的地址: $address"

# 等待用户输入下一个参数
read -p "请输入下一个命令参数 (例如 0xxxx): " param1

# 执行第二个命令
output2=$(./qclient-2.0.2.3-linux-amd64 cross-mint "$param1" --config ./.config)
echo "$output2"

# 提取 peerPublicKey
peerPublicKey=$(echo "$output2" | grep -o '{"peerPublicKey":"[^"]*"}')
echo "提取的 peerPublicKey: $peerPublicKey"

# 等待用户输入下一个字符串
read -p "请输入下一个字符串 (例如 0xxxx): " param2

# 执行第三个命令
output3=$(./qclient-2.0.2.3-linux-amd64 cross-mint "$param2" --config ./.config)
echo "$output3"

# 提取 peerPublicKey
peerPublicKey2=$(echo "$output3" | grep -o '{"peerPublicKey":"[^"]*"}')
echo "提取的 peerPublicKey: $peerPublicKey2"