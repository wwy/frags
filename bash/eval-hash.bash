#!/bin/bash
# by wwy



#
# frag 1
#

COUNTRY=(CN JP US)
CN=(BJ SH)
BJ=(pku tsinghua)
SH=(fudan sjtu tongji)

eval echo \$\{${COUNTRY[0]}[1]\}
eval eval echo \\$\\{\$\{${COUNTRY[0]}[1]\}[1]\\}

# 假设最外层的“\”个数是a，“eval”命令的个数是b，那么a等于2的b-1次幂



#
# frag 2
#

mount=(sdb1 sdb2 sdb3)		# key，可以通过命令自动生成
used=(3.7G 181M 56G)		# value，可以通过命令自动生成

for ((i=0;i<${#mount[@]};i++));do
	sdb=${mount[$i]}
	use=${used[$i]}
	eval ${sdb}_used=\$use	# 使用 eval 生成“hash”
done

echo $sdb1_used
echo $sdb2_used
echo $sdb3_used

