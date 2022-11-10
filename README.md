# 简介

在`ubuntu:18.04`的基础上，安装中文桌面环境，支持SSH和VNC远程连接以及Win远程桌面
<br>

[![Docker Pulls](https://img.shields.io/docker/pulls/gotoeasy/ubuntu-desktop)](https://hub.docker.com/r/gotoeasy/ubuntu-desktop)
[![GitHub release](https://img.shields.io/github/release/gotoeasy/docker-ubuntu-desktop.svg)](https://github.com/gotoeasy/docker-ubuntu-desktop/releases/latest)
[![License](https://img.shields.io/github/license/gotoeasy/docker-ubuntu-desktop)](https://github.com/gotoeasy/docker-ubuntu-desktop/blob/master/LICENSE)

<br>
2022年元旦，服务器中了挖矿木马xmrig，从告警上看，煞有其事的进行下载安装运行，思来想去不应该啊，<br>
查看路径后发现是在某个docker容器中，最终锁定这个远程桌面容器，开放的默认端口，简易的默认密码没有修改！<br>
所以，墙裂建议，修改端口映射！修改提高密码强度！！！<br>
<br>


# 例子
```shell
# 以后台方式运行容器，指定SSH和VNC端口，默认密码为123456
docker run -d -p 22:22 -p 5900:5900 gotoeasy/ubuntu-desktop

# 可以指定密码(必须6位以上)及分辨率
docker run -d -p 5900:5900 -e PASSWD=abcd1234 -e SIZE=1024x768 gotoeasy/ubuntu-desktop

# 用docker-compose方式启动，参考配置docker-compose.yml
docker-compose up
```

# 应用场景举例

- [x] 练习
- [x] 利用服务器资源，远程办公使用
- [x] 在K8S集群中发布，等同集群内网环境中切入一台桌面机，方便确认问题

# 更新履历

### 版本`1.12.0`，`latest`

- [x] 升级`TigerVNC`版本至`1.12.0`，官方见`https://github.com/TigerVNC/tigervnc`
- [x] 其他预装软件同`1.10.1`版本

### 版本`1.10.1`

- [x] 支持汉字复制黏贴，需使用`TigerVNC`官方客户端，见`https://github.com/TigerVNC/tigervnc`
- [x] 增加预装软件`vim`，命令`vi`和`vim`都能用
- [x] 增加预装软件谷歌浏览器`chrome`
- [x] 增加预装软件数据库客户端`mysql-workbench`
- [x] 增加预装软件`svn`
- [x] 增加预装软件`git`
- [x] 默认无壁纸以便感官识别版本

### 版本`vscode-go1.19`

- [x] `1.10.1-base`作为母版
- [x] 预装`vscode 1.71.0`稳定版
- [x] 预装`go1.19`及环境设定，内含`hello`例子，开箱即用

### 版本`vscode-go1.18.3`

- [x] `1.10.1-base`作为母版
- [x] 预装`vscode 1.68.0`稳定版
- [x] 预装`go1.18.3`及环境设定，内含`hello`例子，开箱即用

### 版本`1.10.1-base`

- [x] 精简基础版，保留常用小工具、输入法、火狐浏览器，移除其余XRDP、SSH等不常用软件的预装

### 版本`1.9.0`

- [x] `ubuntu:18.04`
- [x] 用户：`root`
- [x] 默认SSH密码：`123456`
- [x] 默认VNC密码：`123456`
- [x] 预装XRDP，但window的远程桌面连接性能较差所以未启动，需要时自行开启`service xrdp start`，默认端口`3389`
- [x] 预装`wget`、`curl`、`firefox`等少许常用软件
- [x] 时区`Asia/Shanghai`
- [x] 中文桌面环境`xfce`
- [x] 中文输入法
- [x] VNC远程桌面连接时支持和本机之间相互复制粘贴文本

# 截图
![https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg](https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/ssh.jpg)
![https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg](https://gotoeasy.github.io/screenshots/docker-ubuntu-desktop/vnc.jpg)
