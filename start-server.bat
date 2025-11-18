@echo off
chcp 65001 >nul
echo ========================================
echo   音乐节拍图片播放器 - 本地服务器
echo ========================================
echo.
echo 正在启动服务器...
echo.
echo 请查看下面的IP地址，在手机浏览器中输入：http://IP地址:8000
echo.
echo ----------------------------------------
ipconfig | findstr IPv4
echo ----------------------------------------
echo.
echo 按 Ctrl+C 停止服务器
echo.

REM 尝试使用Python 3
python -m http.server 8000 2>nul
if %errorlevel% neq 0 (
    REM 如果Python 3失败，尝试Python 2
    python -m SimpleHTTPServer 8000 2>nul
    if %errorlevel% neq 0 (
        echo 错误：未找到Python，请安装Python或使用其他方法启动服务器
        echo.
        echo 其他启动方法：
        echo 1. 安装Node.js后运行: npx http-server -p 8000
        echo 2. 安装PHP后运行: php -S localhost:8000
        pause
    )
)

