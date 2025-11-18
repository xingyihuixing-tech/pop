#!/bin/bash

echo "========================================"
echo "  音乐节拍图片播放器 - 本地服务器"
echo "========================================"
echo ""
echo "正在启动服务器..."
echo ""
echo "请查看下面的IP地址，在手机浏览器中输入：http://IP地址:8000"
echo ""
echo "----------------------------------------"

# 获取IP地址
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    ipconfig getifaddr en0 || ipconfig getifaddr en1
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    hostname -I | awk '{print $1}'
fi

echo "----------------------------------------"
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""

# 尝试使用Python 3
if command -v python3 &> /dev/null; then
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    python -m http.server 8000
else
    echo "错误：未找到Python，请安装Python或使用其他方法启动服务器"
    echo ""
    echo "其他启动方法："
    echo "1. 安装Node.js后运行: npx http-server -p 8000"
    echo "2. 安装PHP后运行: php -S localhost:8000"
    exit 1
fi

