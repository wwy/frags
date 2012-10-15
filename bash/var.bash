#!/bin/bash
# by wwy

var=
# 前提：如果var定义了，但为空，则：

${var-default}	# 还使用$var（即为空）
${var:-default}	# 使用default字符串，*常用*

${var=default}	# 还使用$var（即为空）
${var:=default}	# 将$var设置成default字符串，*常用*

${var+default}	# 使用default 
${var:+default}	# 使用$var（即为空）

${var?default}	#还使用$var（即为空）
${var:?default}	# 使用default，为作为标准错误输出的一部分内容


${#var}	# 表示$var的长度
${#2}		# 表示脚本的第二个参数的长度
${#@}		# 表示脚本的所有参数的个数
${#array[n]}	# 数组中某个元素的长度

${var#pattern} 	# 最短头匹配截取，*常用*
${var##Pattern}	# 最大头匹配截取，*常用*
${var%Pattern}	# 最短尾匹配截取，*常用*
${var%%Pattern}	# 最大尾匹配截取，*常用*

${var:postion}  	#从左往右看，匹配postion（postion是整数）位置之左的，留下之后的
${var:(-postion)} 	#从右往左看，匹配postion位置之左的，()是为了避免和${var-default}冲突
${var:postion:length}	# 匹配postion位置之前的同时，显示之后的长度为length

${var/Pattern/Replacement} 	# 第一次匹配的被替换，类似：sed 's/Pattern/Replacement/'
${var//Pattern/Replacement} 	# 全局的匹配被替换，类似：sed 's/Pattern/Replacement/g'
${var#/prefix/Replacement}	# 前缀替换
${var%/suffix/Replacement}	# 后缀替换

${!var_prefix*} ${!var_prefix@}	# 得到变量名，输出所有前缀一样的变量名，不支持glob

