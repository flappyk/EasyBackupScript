#!/bin/bash

#设定
ghost_dir=/home/ghost/web
bak_dir=/home/ghost/bak

#设定数据库
#mysql_host=localhost
mysql_db=me
mysql_user=me
mysql_pass=huaban1993

#开始
start_time=$(date +%Y-%m-%d_%H%M)
echo -e $start_time " : 备份开始\n" >> $bak_dir/bak.log

mkdir -p $bak_dir/$start_time/

#压缩文件
tar zcvf $bak_dir/$start_time/ghost.tar.gz $ghost_dir/ --exclude=$ghost_dir/node_modules

#备份mysql
mysqldump -u$mysql_user -p$mysql_pass $mysql_db > $bak_dir/$start_time/$mysql_db.sql

#压缩文件


#结束
echo -e $(date +%Y-%m-%d_%H%M) " : 备份结束\n\n" >> $bak_dir/bak.log
