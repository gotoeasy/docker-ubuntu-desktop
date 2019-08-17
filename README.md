# 简介
在`ubuntu:18.04`的基础上，安装中文桌面环境，支持VNC远程连接

# 例子
```
// 以后台方式运行容器，指定vnc的默认端口，默认密码为123456
docker run -d -p 5900:5900 gotoeasy/ubuntu-desktop

// 可以指定密码(必须6位以上)及分辨率
docker run -d -p 5900:5900 -e PASSWD=abcd1234 -e SIZE=1024x768 gotoeasy/ubuntu-desktop
```

# 内容

- [x] `ubuntu:18.04`
- [x] 用户：`root`
- [x] 默认VNC密码：`123456`
- [x] 预装`wget`、`curl`、`firefox`等个别常用软件
- [x] 时区`Asia/Shanghai`
- [x] 中文桌面环境`xfce`
- [x] 中文输入法
- [x] 支持和宿主机之间相互复制粘贴文本

# 截屏
![https://github.com/gotoeasy/docker/blob/master/ubuntu-desktop/vnc.jpg](https://github.com/gotoeasy/docker/blob/master/ubuntu-desktop/vnc.jpg)
