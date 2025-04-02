#!/bin/bash

# 检查 user_list.txt 文件是否存在
if [ ! -f "user_list.txt" ]; then
    echo "user_list.txt 文件不存在，请检查。"
    exit 1
fi

# 逐行读取 user_list.txt 文件
while IFS= read -r username; do
    # 检查用户是否已经存在
    if id "$username" &>/dev/null; then
        echo "用户 $username 已存在，跳过。"
    else
        # 创建用户
        useradd "$username"
        if [ $? -eq 0 ]; then
            echo "用户 $username 创建成功！"
        else
            echo "用户 $username 创建失败。"
        fi
    fi
done < user_list.txt