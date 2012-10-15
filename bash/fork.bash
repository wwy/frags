#!/bin/bash
# by wwy

function    a_sub   { # 此处定义一个函数，作为一个线程(子进程)
        date && sleep 3 
}

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile	# 新建一个fifo类型的文件（命名管道）
exec 6<>$tmp_fifofile	# 将fd6指向fifo类型
rm $tmp_fifofile

thread=15	# 此处定义线程数
for ((i=0;i<$thread;i++));do echo;done >&6	# 事实上是在fd6中放置了$thread个回车符

for ((i=0;i<50;i++));do	# 50次循环（并发数是 15）

	read -u6
	# 一个read -u6命令执行一次就从fd6中减去一个回车符，然后向下执行，没有回车符时就停止，从而实现了线程数量控制

	{ # 此处子进程开始执行，被放到后台
		a_sub 
		echo >&6 # 当进程结束以后，再向fd6中加上一个回车符，即补上了read -u6减去的那个
	} &

done
wait		# 等待所有的后台子进程结束
exec 6>&-	# 关闭df6

