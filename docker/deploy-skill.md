# RuoYi-Vue-Pro CentOS Docker 部署 Skill

## 用途
指导 opencode 在 CentOS 服务器上使用 Docker 部署 ruoyi-vue-pro 全栈项目（后端 Spring Boot + 前端 Vue3 + MySQL + Redis + Nginx）。

## 前提条件

### 服务器要求
- CentOS 7+ / Rocky Linux 8+
- Docker 24+（安装: `yum install -y docker-ce docker-ce-cli containerd.io`）
- Docker Compose V2 插件（安装: `yum install -y docker-compose-plugin`）
- Git（安装: `yum install -y git`）
- JDK 17+（安装: `yum install -y java-17-openjdk-devel`）
- Maven 3.6+（安装: `yum install -y maven`）
- 最低配置: 2 核 CPU / 4G 内存 / 20G 磁盘

### 网络要求
- 防火墙开放 48080（后端 API）和 8080（管理后台）端口
- SE Linux 建议设置为 permissive 或配置正确 context

## 部署流程

### 1. 一键部署（推荐）
```bash
# 克隆项目
git clone https://github.com/leangjia/ruoyi-vue-pro.git
cd ruoyi-vue-pro

# 给脚本执行权限
chmod +x setup.sh

# 执行一键部署（自动完成：构建后端 → 克隆前端 → 开放端口 → 启动服务）
./setup.sh
```

### 2. 手动部署（分步）

#### 2.1 构建后端
```bash
mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4
```

#### 2.2 准备前端
```bash
# 克隆前端项目到 yudao-ui-admin 目录
git clone https://github.com/yudaocode/yudao-ui-admin-vue3.git yudao-ui-admin
# Docker 构建时会自动执行 npm install && npm run build
```

#### 2.3 配置环境变量
```bash
# 编辑 .env 文件，按需修改关键配置：
#   MYSQL_ROOT_PASSWORD - 数据库密码（默认 123456）
#   SPRING_PROFILES_ACTIVE - Spring profile（默认 local）
#   VUE_APP_BASE_API - API 代理前缀（默认 /prod-api）
```

#### 2.4 启动服务
```bash
# 前台启动（调试用）
docker compose --env-file .env up

# 后台启动
docker compose --env-file .env up -d
```

#### 2.5 检查状态
```bash
# 查看所有服务
docker compose ps

# 查看日志
docker compose logs -f server
docker compose logs -f admin

# 健康检查
curl http://localhost:48080/actuator/health
```

## 架构说明

```
浏览器 ──> Nginx (端口 80) ── 静态文件 ──> Vue3 (dist)
                │
                └── /prod-api/* ── proxy ──> Java 后端 (端口 48080)
                                               │
                                        ┌──────┴──────┐
                                     MySQL 8.0     Redis 7
```

### 服务端口映射
| 服务 | 内部端口 | 外部端口 | 说明 |
|------|----------|----------|------|
| mysql | 3306 | 3306 | MySQL 数据库 |
| redis | 6379 | 6379 | Redis 缓存 |
| server | 48080 | 48080 | Java Spring Boot 后端 |
| admin | 80 | 8080 | Vue3 + Nginx 前端 |

### 数据持久化
- MySQL: `mysql-data` volume → `/var/lib/mysql`
- Redis: `redis-data` volume → `/data`

## 常用操作

### 停止服务
```bash
docker compose down
```

### 重启服务
```bash
docker compose restart server
```

### 查看日志
```bash
docker compose logs -f --tail=100 server
```

### 更新部署
```bash
# 1. 拉取最新代码
git pull

# 2. 重新构建后端 JAR
mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4

# 3. 重新构建镜像并启动
docker compose up -d --build
```

### 数据备份
```bash
# 备份 MySQL
docker exec yudao-mysql mysqldump -u root -p123456 ruoyi-vue-pro > backup.sql

# 备份 Volume
docker run --rm -v mysql-data:/source -v $(pwd):/backup alpine tar czf /backup/mysql-data-backup.tar.gz -C /source .
```

## 故障排查

### 后端无法连接 MySQL
- 原因: MySQL 容器启动较慢，后端先于 MySQL 就绪
- docker-compose.yml 已配置 `condition: service_healthy`，等待即可

### 前端页面白屏 / 404
- 检查 nginx 配置中 `proxy_pass http://server:48080/` 末尾的 `/` 是否缺失
- 确认 `VUE_APP_BASE_API` 与 nginx 的 `location /prod-api/` 匹配

### 数据库连接拒绝
```bash
# 检查 MySQL 日志
docker compose logs mysql

# 重置数据卷重新启动
docker compose down -v && docker compose up -d
```

### 端口被占用
```bash
# 检查端口
ss -tlnp | grep -E '48080|8080|3306|6379'
# 修改 .env 中对应端口
```

### CentOS 防火墙
```bash
firewall-cmd --permanent --add-port=48080/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload
```

### SE Linux
```bash
# 临时放行
setenforce 0
# 永久放行（编辑 /etc/selinux/config）
# SELINUX=permissive
```

## 安全建议
1. 修改 `.env` 中的 `MYSQL_ROOT_PASSWORD`
2. 生产环境使用 `spring.profiles.active=prod`
3. 配置 HTTPS（在 nginx 中添加 SSL 证书）
4. 限制容器资源（在 compose 中添加 `deploy.resources.limits`）
5. 定期备份数据库
