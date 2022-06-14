# 基础镜像
FROM gotoeasy/ubuntu-desktop:1.10.1-base
# 维护者信息
MAINTAINER gotoeasy <gotoeasy@163.com>

# 安装
RUN \
    # VsCode
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
    apt-get -y update && \
    apt-get install -y code && \
    apt-get install -y build-essential && \
    apt-get install -y tree && \
    sed -i 's/--unity-launch/--no-sandbox --unity-launch/' /usr/share/applications/code.desktop && \
    # go
    wget https://golang.google.cn/dl/go1.18.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && \
    echo 'export GO111MODULE=on' >> ~/.bashrc && \
    echo 'export GOPROXY=https://mirrors.aliyun.com/goproxy/' >> ~/.bashrc && \
    source ~/.bashrc && \
    mkdir -p ~/Desktop/project/hello && \
    cd ~/Desktop/project/hello && \
    go mod init hello && \
    echo 'package main' > ~/Desktop/project/hello/main.go && \
    echo 'import "fmt"' >> ~/Desktop/project/hello/main.go && \
    echo 'func main() {' >> ~/Desktop/project/hello/main.go && \
    echo '    fmt.Println("hello")' >> ~/Desktop/project/hello/main.go && \
    echo '}' >> ~/Desktop/project/hello/main.go && \
    # clean
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
