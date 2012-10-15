#!/bin/bash

exec 6<&0	# 将文件描述符#6与stdin链接起来（保存stdin） 
exec < data-file	# stdin 被文件"data-file"所代替

read a1	# 读取文件"data-file"的第一行
read a2	# 读取文件"data-file"的第二行

echo $a1
echo $a2

exec 0<&6 6<&-	# 将stdin从fd6中恢复，并关闭fd6 ( 6<&- )

read b1	# 此处开始，"read"已经恢复正常了, 从stdin中读取
echo "b1 = $b1"

