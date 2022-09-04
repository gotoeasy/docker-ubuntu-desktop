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
    apt-get clean && \
    apt-get -y update && \
    apt-get install -y code && \
    apt-get install -y build-essential && \
    apt-get install -y tree && \
    sed -i 's/--unity-launch/--no-sandbox --unity-launch/' /usr/share/applications/code.desktop && \
    # go
    cd && \
    wget https://golang.google.cn/dl/go1.19.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz && \
    rm -f go1.19.linux-amd64.tar.gz && \
    echo '' >> ~/.bashrc && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && \
    echo 'export GO111MODULE=on' >> ~/.bashrc && \
    echo 'export GOPROXY=https://goproxy.cn,direct' >> ~/.bashrc && \
    chmod 777 ~/.bashrc && \
    /usr/local/go/bin/go env -w GO111MODULE=on && \
    /usr/local/go/bin/go env -w GOPROXY=https://goproxy.io,direct && \
    mkdir -p ~/Desktop/project/hello && \
    cd ~/Desktop/project/hello && \
    /usr/local/go/bin/go mod init hello && \
    echo 'package main' > ~/Desktop/project/hello/main.go && \
    echo 'import "fmt"' >> ~/Desktop/project/hello/main.go && \
    echo 'func main() {' >> ~/Desktop/project/hello/main.go && \
    echo '    fmt.Println("hello")' >> ~/Desktop/project/hello/main.go && \
    echo '}' >> ~/Desktop/project/hello/main.go && \
    /usr/local/go/bin/go install -v golang.org/x/tools/gopls@latest && \
    /usr/local/go/bin/go install -v github.com/go-delve/delve/cmd/dlv@latest && \
    # clean
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
