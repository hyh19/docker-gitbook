# docker-gitbook

环境参数

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.5 LTS
Release:        18.04
Codename:       bionic

$ docker -v
Docker version 19.03.13, build 4484c46d9d

$ docker-compose -v
docker-compose version 1.27.4, build 40524192
```

构建镜像

```bash
DOCKER_BUILDKIT=1 docker build -t mrhuangyuhui/gitbook:latest -t mrhuangyuhui/gitbook:3.2.3-node-10-alpine .
```

推送镜像

```bash
docker login

docker push mrhuangyuhui/gitbook:latest \
&& docker push mrhuangyuhui/gitbook:3.2.3-node-10-alpine
```

创建测试项目

```bash
export WORKDIR="/tmp/test" \
&& rm -rf $WORKDIR \
&& mkdir -p $WORKDIR \
&& cd $WORKDIR
```

初始化项目

```bash
docker run -it --rm \
           -v "$PWD":/book \
           -w /book \
           mrhuangyuhui/gitbook \
           gitbook init
```

启动本地服务器

```bash
docker run -it --rm \
           -v "$PWD":/book \
           -w /book \
           -p 4000:4000 \
           -p 35729:35279 \
           mrhuangyuhui/gitbook \
           sh -c "gitbook install && gitbook serve"
```

将容器创建的文件的所有者更改为宿主机用户

```bash
sudo chown -R `id -u`:`id -g` .
```
