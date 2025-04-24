#!/bin/bash

ip=$(ifconfig | awk '/inet / && $2 ~ /^192\.168\./ { print $2 }')
echo "Địa chỉ IP là: $ip"
