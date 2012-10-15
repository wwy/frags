#!/bin/bash


lockfile=/tmp/mylock

if 　(set -C;echo $$ >$lockfile) 2>/dev/null　;　then
# set -C 使已存在的文件不能再被写
# echo 不旦生成了锁文件，而且还将pid放入其中
# 当此lock文件存在时，if返回失败，跳到else

	trap 'rm $lockfile; exit $?' INT TERM EXIT	# trap保证了脚本异常中断时，释放锁文件（删）
	{
		cat <<-E
			my critical code...	# 此处是正式的脚本代码
			my critical code...
			my critical code...
		E
	}
	rm  $lockfile		# 正式代码运行完了，释放锁文件
	trap - INT TERM EXIT	# 恢复trap的设置（如在脚本最后时，非必要恢复）
	exit 0

else
	# 锁文件生效，会跳到此处
	echo "$lockfile exist, pid $(<$lockfile) is running." 
	# 打印错误信息（其中红色的，比 $(cat $lockfile)更效率）
        exit 1
fi

