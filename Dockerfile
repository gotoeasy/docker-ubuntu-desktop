# 基础镜像
FROM ubuntu:18.04
# 维护者信息
MAINTAINER gotoeasy <gotoeasy@163.com>

# 环境变量
ENV DEBIAN_FRONTEND=noninteractive \
    SIZE=1600x840 \
    PASSWD=123456 \
    TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8

USER root
WORKDIR /root

# 设定密码
RUN echo "root:$PASSWD" | chpasswd

# 安装
RUN apt-get -y update && \
    # tools
    apt-get install -y wget curl net-tools locales bzip2 iputils-ping traceroute firefox firefox-locale-zh-hans ttf-wqy-microhei gedit ibus-pinyin && \
    locale-gen zh_CN.UTF-8 && \
    # TigerVNC
    wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.9.0.x86_64.tar.gz | tar xz --strip 1 -C / && \
    mkdir -p /root/.vnc && \
    echo $PASSWD | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd && \
    # xfce
    apt-get install -y xfce4 xfce4-terminal && \
    apt-get purge -y pm-utils xscreensaver* && \
    # clean
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 配置xfce图形界面
ADD ./xfce/ /root/

# 创建脚本文件
RUN echo "#!/bin/bash\n" > /root/startup_vnc.sh && \
    echo 'vncserver -kill :0' >> /root/startup_vnc.sh && \
    echo "rm -rfv /tmp/.X*-lock /tmp/.X11-unix" >> /root/startup_vnc.sh && \
    echo 'vncserver :0 -geometry $SIZE' >> /root/startup_vnc.sh && \
    echo 'tail -f /root/.vnc/*:0.log' >> /root/startup_vnc.sh && \
    chmod +x /root/startup_vnc.sh

# 用户目录不使用中文
RUN LANG=C xdg-user-dirs-update --force


# 导出特定端口
EXPOSE 5900

# 启动脚本
CMD ["/root/startup_vnc.sh"]

