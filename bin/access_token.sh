#!/bin/bash

token_path=/home/projects/token

# 输入账号
read -p "请输入账号: " username

# 输入密码（隐藏输入）
read -s -p "请输入密码: " password

#curl -s -X POST -H "Content-Type: application/json" -d "{\"username\":\"${username}\",\"password\":\"${password}\"}" http://localhost:7080/chatgpt/login | jq -r .accessToken
res_json=$(curl -s -X POST -H "Content-Type: application/json" -d "{\"username\":\"${username}\",\"password\":\"${password}\"}" http://localhost:7080/chatgpt/login)
access_token=$(echo $res_json | jq -r .accessToken)
refresh_token=$(echo $res_json | jq -r .refreshToken)

timestamp=$(date +%s)
formatted_date=$(date -d @$timestamp +"%Y%m%d_%H_%M_%S")

echo $res_json > "$token_path/$formatted_date"

echo -e "\n$access_token"

#echo $token > /home/projects/2/pandora_server/data/access_token.dat

#docker restart pandora_server
