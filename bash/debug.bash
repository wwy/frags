#!/bin/bash

function my_debug {
       set -x
       read -t 1	# 一行代码延迟一秒，按回车可以加速
}

trap my_debug DEBUG

echo 1
echo 2
echo 3

