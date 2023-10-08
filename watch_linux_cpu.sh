 #!/bin/bash
 # @Author: shgopher shgopher@gmail.com
 # @Date: 2023-10-08 17:23:42
 # @LastEditors: shgopher shgopher@gmail.com
 # @LastEditTime: 2023-10-08 17:24:50
 # @FilePath: /shelltool/watch_linux_cpu.sh
 # @Description: 
 # 
 # Copyright (c) 2023 by shgopher, All Rights Reserved. 



while :
do 
    ## 使用top命令获取 cpu idle 的值
    idle=`top -bn1 |sed -n '3p' |awk -F 'ni,' '{print $2}' |cut -d. -f1 |sed '
    s/ //g'`

    use=$[100 - $idle]
    if [ $use -gt 90 ]
    then
        echo "cpu useage: $use%"
        # 此处可以部署一个向外发送信息的命令
    fi 
    sleep 10
done
        
  
  
