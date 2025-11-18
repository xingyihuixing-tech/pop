# 安卓手机使用指南

有几种方式可以在安卓手机上使用这个应用：

## 方法一：通过局域网访问（推荐，最简单）

### 步骤：

1. **在电脑上启动本地服务器**

   **使用Python（如果已安装）：**
   ```bash
   # Python 3
   python -m http.server 8000
   
   # 或 Python 2
   python -m SimpleHTTPServer 8000
   ```

   **使用Node.js（如果已安装）：**
   ```bash
   npx http-server -p 8000
   ```

   **使用PHP（如果已安装）：**
   ```bash
   php -S localhost:8000
   ```

2. **查看电脑的IP地址**
   - Windows: 打开命令提示符，输入 `ipconfig`，找到"IPv4 地址"
   - 例如：`192.168.1.100`

3. **在安卓手机上访问**
   - 确保手机和电脑连接在同一个WiFi网络
   - 打开手机浏览器（推荐Chrome）
   - 输入地址：`http://192.168.1.100:8000`
   - 例如：如果IP是192.168.1.100，就访问 `http://192.168.1.100:8000`

4. **添加到主屏幕（可选）**
   - 在浏览器菜单中选择"添加到主屏幕"
   - 这样可以直接从桌面启动应用

## 方法二：部署到免费托管服务

### GitHub Pages（推荐）

1. 在GitHub创建新仓库
2. 上传所有项目文件
3. 在仓库设置中启用GitHub Pages
4. 访问 `https://你的用户名.github.io/仓库名`

### Netlify

1. 访问 https://www.netlify.com
2. 注册账号
3. 拖拽项目文件夹到Netlify
4. 获得一个免费的网址，例如：`https://your-app.netlify.app`

### Vercel

1. 访问 https://vercel.com
2. 注册账号
3. 导入项目
4. 获得部署网址

## 方法三：使用USB传输文件（需要手动启动服务器）

1. 将整个项目文件夹复制到安卓手机
2. 在手机上安装支持本地服务器的应用，如：
   - "Simple HTTP Server" (Android)
   - "HTTP Server" (Android)
3. 在应用中打开项目文件夹
4. 启动服务器，访问显示的本地地址

## 方法四：使用二维码快速访问

1. 在电脑上启动本地服务器（方法一）
2. 生成二维码：
   - 访问 https://www.qrcode-monkey.com
   - 输入你的服务器地址（如：`http://192.168.1.100:8000`）
   - 生成二维码
3. 用手机扫描二维码即可访问

## 注意事项

- **HTTPS要求**：某些功能（如文件系统访问）需要HTTPS，但基本功能在HTTP下也能工作
- **防火墙**：确保电脑防火墙允许8000端口的连接
- **网络**：手机和电脑必须在同一WiFi网络
- **浏览器**：推荐使用Chrome浏览器以获得最佳体验

## 快速启动脚本

### Windows批处理文件（start-server.bat）

创建 `start-server.bat` 文件，内容如下：

```batch
@echo off
echo 正在启动服务器...
echo.
echo 请查看下面的IP地址，在手机浏览器中输入：http://IP地址:8000
echo.
ipconfig | findstr IPv4
echo.
python -m http.server 8000
pause
```

双击运行即可启动服务器。

