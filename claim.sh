#!/bin/bash

# 切换到指定目录
cd ~/ceremonyclient/node/

# 执行第一个命令并提取账户地址
output=$(./../client/qclient-2.0.1-linux-amd64 token balance)
echo "$output"

# 提取地址
address=$(echo "$output" | grep -o '0x[a-zA-Z0-9]*')
echo "提取的地址: $address"

# 等待用户输入下一个参数
read -p "请输入下一个命令参数 (例如 0xxxx): " param1

# 执行第二个命令
output2=$(./../client/qclient-2.0.1-linux-amd64 cross-mint "$param1")
echo "$output2"

# 提取 peerPublicKey
peerPublicKey=$(echo "$output2" | grep -o '{"peerPublicKey":"[^"]*"}')
echo "提取的 peerPublicKey: $peerPublicKey"

# 等待用户输入下一个字符串
read -p "请输入下一个字符串 (例如 0xxxx): " param2

# 执行第三个命令
output3=$(./../client/qclient-2.0.1-linux-amd64 cross-mint "$param2")
echo "$output3"

# 提取 peerPublicKey
peerPublicKey2=$(echo "$output3" | grep -o '{"peerPublicKey":"[^"]*"}')
echo "提取的 peerPublicKey: $peerPublicKey2"