# 简介

在`ubuntu:18.04`的基础上，安装中文桌面环境，支持SSH和VNC远程连接
<br>

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Image Layers](https://img.shields.io/microbadger/layers/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Image Size](https://img.shields.io/microbadger/image-size/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![Docker Pulls](https://img.shields.io/docker/pulls/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)

<br>

# 例子
```
// 以后台方式运行容器，指定SSH和VNC端口，默认密码为123456
docker run -d -p 22:22 -p 5900:5900 gotoeasy/ubuntu-desktop

// 可以指定密码(必须6位以上)及分辨率
docker run -d -p 22:22 -p 5900:5900 -e PASSWD=abcd1234 -e SIZE=1024x768 gotoeasy/ubuntu-desktop
```

# 内容

- [x] `ubuntu:18.04`
- [x] 用户：`root`
- [x] 默认SSH密码：`123456`
- [x] 默认VNC密码：`123456`
- [x] 预装XRDP，但window的远程桌面连接性能较差所以未启动，需要时自行开启`service xrdp restart`，默认端口`3389`
- [x] 预装`wget`、`curl`、`firefox`等少许常用软件
- [x] 时区`Asia/Shanghai`
- [x] 中文桌面环境`xfce`
- [x] 中文输入法
- [x] VNC远程桌面连接时支持和本机之间相互复制粘贴文本

# 截图
![http://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg](http://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg)
![http://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg](http://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg)
