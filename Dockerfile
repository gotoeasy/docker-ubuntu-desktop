# 基础镜像
FROM ubuntu:18.04
# 维护者信息
MAINTAINER gotoeasy <gotoeasy@163.com>

# 环境变量
ENV DEBIAN_FRONTEND=noninteractive \
    SIZE=1600x840 \
    PASSWD=123456 \
    TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LC_ALL=${LANG} \
    LANGUAGE=${LANG}

USER root
WORKDIR /root

# 设定密码
RUN echo "root:$PASSWD" | chpasswd

# 安装
RUN apt-get -y update && \
    # tools
    apt-get install -y wget curl net-tools locales bzip2 unzip iputils-ping traceroute firefox firefox-locale-zh-hans ttf-wqy-microhei gedit ibus-pinyin && \
    locale-gen zh_CN.UTF-8 && \
    # ssh
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir -p /root/.ssh && \
    # TigerVNC
    #wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.9.0.x86_64.tar.gz | tar xz --strip 1 -C / && \
    wget -qO- https://nchc.dl.sourceforge.net/project/tigervnc/stable/1.12.0/tigervnc-1.12.0.x86_64.tar.gz | tar xz --strip 1 -C / && \
    mkdir -p /root/.vnc && \
    echo $PASSWD | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd && \
    # xfce
    apt-get install -y xfce4 xfce4-terminal && \
    apt-get purge -y pm-utils xscreensaver* && \
    # xrdp
    apt-get install -y xrdp && \
    echo "xfce4-session" > ~/.xsession && \
    # clean
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 配置xfce图形界面
ADD ./xfce/ /root/

# 创建脚本文件
RUN echo "#!/bin/bash\n" > /root/startup.sh && \
    # 修改密码
    echo 'if [ $PASSWD ] ; then' >> /root/startup.sh && \
    echo '    echo "root:$PASSWD" | chpasswd' >> /root/startup.sh && \
    echo '    echo $PASSWD | vncpasswd -f > /root/.vnc/passwd' >> /root/startup.sh && \
    echo 'fi' >> /root/startup.sh && \
    # SSH
    echo "/usr/sbin/sshd -D & source /root/.bashrc" >> /root/startup.sh && \
    # VNC
    echo 'vncserver -kill :0' >> /root/startup.sh && \
    echo "rm -rfv /tmp/.X*-lock /tmp/.X11-unix" >> /root/startup.sh && \
    echo 'vncserver :0 -geometry $SIZE' >> /root/startup.sh && \
    echo 'tail -f /root/.vnc/*:0.log' >> /root/startup.sh && \
    # 可执行脚本
    chmod +x /root/startup.sh

# 用户目录不使用中文
RUN LANG=C xdg-user-dirs-update --force


# 导出特定端口
EXPOSE 22 5900 3389

# 启动脚本
CMD ["/root/startup.sh"]

