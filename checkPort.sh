#!/usr/bin/env bash
# author: kim
# desc: 端口存活检测
# usage：./checkPort.sh {port}

PORT=$1
# 重启服务
Cmd(){
    echo "Notice......  √"
    # go build -o app app.go
    chmod +x ./app
    nohup ./app &
}

# 检测服务
CheckPort(){
    ctx=`netstat -lntup | grep -w  $PORT | wc -l`
    if [ $ctx -eq 0 ]
    then
        Cmd
        echo "${PORT} is down,Starting..."
        CheckPort
    else
        echo "${PORT} is running"
    fi
}

CheckPort