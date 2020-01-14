#!/usr/bin/env bash
# author: kim
# desc: 服务存活检测

# 重启服务
Cmd(){
    echo "Notice......  √"
    /usr/local/nginx/sbin/nginx
}

# 检测服务
CheckNginx(){
    psCtx=`ps -aux |grep nginx | grep -v "grep" | wc -l`
    if [ $psCtx -eq 0 ]
    then
       Cmd
       echo "Nginx is down,Starting..."
    else
       echo "Nginx is running"
    fi
}

CheckNginx
