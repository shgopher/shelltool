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

# top -bn1: 运行 top 命令,限制只显示一次输出(-n1),不显示任何冗余信息(-b)。

# sed -n '3p': 从 top 命令的输出中,只打印第3行。top 命令的第3行显示了CPU的使用信息。

# awk -F 'ni,' '{print $2}': awk 命令,以 ",ni" 为分隔符,打印出第2个字段。这个字段包含 idle 的CPU使用率。

# cut -d. -f1: 切出 idle 率中的整数部分,删除小数点之后的内容。

# sed 's/ //g': 删除结果中的所有空格。
        
  
  
