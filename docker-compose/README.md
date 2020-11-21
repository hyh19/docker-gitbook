# docker-compose

开发环境

```bash
# 设置 NPM 淘宝镜像
export NPM_REGISTRY="https://registry.npm.taobao.org"

# 构建镜像
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
docker-compose -f docker-compose-dev.yml build

# 启动服务
docker-compose -f docker-compose-dev.yml up

# 停止服务
docker-compose -f docker-compose-dev.yml down
```

生产环境

```bash
# 设置 NPM 淘宝镜像
export NPM_REGISTRY="https://registry.npm.taobao.org"

# 构建镜像
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 \
docker-compose -f docker-compose-prd.yml build

# 启动服务
docker-compose -f docker-compose-prd.yml up

# 停止服务
docker-compose -f docker-compose-prd.yml down
```
