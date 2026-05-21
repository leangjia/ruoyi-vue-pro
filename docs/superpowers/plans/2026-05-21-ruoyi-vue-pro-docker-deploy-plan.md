# RuoYi-Vue-Pro Docker 部署实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 创建 Docker 部署全套文件 + Opencode skill，实现在 CentOS 上全栈部署 ruoyi-vue-pro

**Architecture:** 4 个 Docker 服务（mysql 8.0、redis 7、Java 21 后端、Vue3+Nginx 前端）+ 一键部署脚本 setup.sh + Opencode skill 指导自动部署

**Tech Stack:** Docker Compose V2, MySQL 8.0, Redis 7, Java 21, Nginx, Vue 3, CentOS

---

### Task 1: 创建 docker-compose.yml

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\docker-compose.yml`

- [ ] **Step 1: 编写 docker-compose.yml**

```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: yudao-mysql
    restart: always
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
      - ./sql/init-database.sql:/docker-entrypoint-initdb.d/init-database.sql
      - ./sql/init-schema.sql:/docker-entrypoint-initdb.d/init-schema.sql
      - ./sql/init-data.sql:/docker-entrypoint-initdb.d/init-data.sql
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD:-123456}
      MYSQL_DATABASE: ${MYSQL_DATABASE:-ruoyi-vue-pro}
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - ruoyi-network

  redis:
    image: redis:7-alpine
    container_name: yudao-redis
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 5
    networks:
      - ruoyi-network

  server:
    build:
      context: ./yudao-server
      dockerfile: Dockerfile
    container_name: yudao-server
    restart: always
    ports:
      - "${SERVER_PORT:-48080}:48080"
    depends_on:
      mysql:
        condition: service_healthy
      redis:
        condition: service_healthy
    environment:
      SPRING_PROFILES_ACTIVE: ${SPRING_PROFILES_ACTIVE:-local}
      MASTER_DATASOURCE_URL: jdbc:mysql://mysql:3306/${MYSQL_DATABASE:-ruoyi-vue-pro}?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&nullCatalogMeansCurrent=true&rewriteBatchedStatements=true
      MASTER_DATASOURCE_USERNAME: root
      MASTER_DATASOURCE_PASSWORD: ${MYSQL_ROOT_PASSWORD:-123456}
      SLAVE_DATASOURCE_URL: jdbc:mysql://mysql:3306/${MYSQL_DATABASE:-ruoyi-vue-pro}?useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&nullCatalogMeansCurrent=true&rewriteBatchedStatements=true
      SLAVE_DATASOURCE_USERNAME: root
      SLAVE_DATASOURCE_PASSWORD: ${MYSQL_ROOT_PASSWORD:-123456}
      REDIS_HOST: redis
      YUDAO_IOT_MESSAGE_BUS_TYPE: local
      YUDAO_IOT_TDENGINE_ENABLED: "false"
    networks:
      - ruoyi-network

  admin:
    build:
      context: ./yudao-ui-admin
      dockerfile: Dockerfile
      args:
        VUE_APP_BASE_API: ${VUE_APP_BASE_API:-/prod-api}
    container_name: yudao-admin
    restart: always
    ports:
      - "${ADMIN_PORT:-8080}:80"
    depends_on:
      - server
    networks:
      - ruoyi-network

volumes:
  mysql-data:
  redis-data:

networks:
  ruoyi-network:
    driver: bridge
```

- [ ] **Step 2: 验证文件存在**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\docker-compose.yml"`

---

### Task 2: 创建 nginx/default.conf

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\nginx\default.conf`

- [ ] **Step 1: 创建 Nginx 配置文件**

```nginx
server {
    listen 80;
    server_name localhost;

    gzip on;
    gzip_min_length 1k;
    gzip_types text/plain application/javascript application/x-javascript text/css application/xml text/javascript;
    gzip_vary on;
    gzip_disable "MSIE [1-6]\.";

    root /usr/share/nginx/html;
    index index.html;

    location /prod-api/ {
        proxy_pass http://server:48080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 60s;
        proxy_read_timeout 60s;
    }

    location / {
        try_files $uri $uri/ /index.html;
        expires -1;
    }
}
```

- [ ] **Step 2: 验证目录和文件**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\nginx\default.conf"`

---

### Task 3: 创建 .env

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\.env`

- [ ] **Step 1: 编写 .env 文件**

```bash
# MySQL
MYSQL_ROOT_PASSWORD=123456
MYSQL_DATABASE=ruoyi-vue-pro

# Redis
REDIS_PORT=6379

# 后端
SPRING_PROFILES_ACTIVE=local
SERVER_PORT=48080
YUDAO_IOT_MESSAGE_BUS_TYPE=local
YUDAO_IOT_TDENGINE_ENABLED=false

# 前端
VUE_APP_BASE_API=/prod-api
ADMIN_PORT=8080
```

- [ ] **Step 2: 验证文件**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\.env"`

---

### Task 4: 创建前端多阶段 Dockerfile

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\yudao-ui-admin\Dockerfile`

- [ ] **Step 1: 创建前端 Dockerfile（多阶段构建）**

```dockerfile
FROM node:20-alpine AS build

WORKDIR /app
ARG VUE_APP_BASE_API=/prod-api

COPY package.json package-lock.json ./
RUN npm install --registry=https://registry.npmmirror.com

COPY . .
ENV VUE_APP_BASE_API=${VUE_APP_BASE_API}
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN echo 'server { \
    listen 80; \
    gzip on; \
    gzip_min_length 1k; \
    gzip_types text/plain application/javascript application/x-javascript text/css; \
    root /usr/share/nginx/html; \
    index index.html; \
    location /prod-api/ { \
        proxy_pass http://server:48080/; \
        proxy_set_header Host \$host; \
        proxy_set_header X-Real-IP \$remote_addr; \
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for; \
        proxy_set_header X-Forwarded-Proto \$scheme; \
    } \
    location / { \
        try_files \$uri \$uri/ /index.html; \
        expires -1; \
    } \
}' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

- [ ] **Step 2: 创建 nginx 配置的副本给前端构建用（Docker build context 内引用）**

The nginx config will be copied from the shared `nginx/default.conf` in the project root during the build context setup. The setup.sh handles this.

- [ ] **Step 3: 验证文件**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\yudao-ui-admin\Dockerfile"`

---

### Task 5: 导出数据库初始化 SQL

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\sql\init-database.sql`
- Create: `D:\opencodeproject\ruoyi-vue-pro\sql\init-schema.sql`
- Create: `D:\opencodeproject\ruoyi-vue-pro\sql\init-data.sql`

- [ ] **Step 1: 创建 init-database.sql**

```sql
CREATE DATABASE IF NOT EXISTS ruoyi-vue-pro CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

- [ ] **Step 2: 从本地 MySQL 导出全量表结构**

Run: `& "D:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" -u root --no-data --routines --triggers ruoyi-vue-pro > "D:\opencodeproject\ruoyi-vue-pro\sql\init-schema.sql" 2>&1`

- [ ] **Step 3: 从本地 MySQL 导出基础数据（只导配置、字典、菜单等基础表，跳过业务数据）**

Run: `& "D:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" -u root --no-create-info ruoyi-vue-pro system_dept system_dict_data system_dict_type system_menu system_role system_role_menu system_user system_user_role system_config system_notice system_post system_login_log system_operate_log system_sms_channel system_sms_template system_sms_log system_error_code infra_config infra_file_config infra_job infra_job_log infra_api_access_log infra_api_error_log infra_data_source_config infra_file_content > "D:\opencodeproject\ruoyi-vue-pro\sql\init-data.sql" 2>&1`

(需要根据本地 MySQL 的安装路径调整 mysqldump 路径)

- [ ] **Step 4: 验证 SQL 文件存在且非空**

Run: `Get-Item "D:\opencodeproject\ruoyi-vue-pro\sql\init-database.sql", "D:\opencodeproject\ruoyi-vue-pro\sql\init-schema.sql", "D:\opencodeproject\ruoyi-vue-pro\sql\init-data.sql" | Select-Object Name, Length`

---

### Task 6: 创建 setup.sh（CentOS 部署脚本）

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\setup.sh`

- [ ] **Step 1: 编写 setup.sh**

```bash
#!/bin/bash
set -euo pipefail

# ============================================================
# RuoYi-Vue-Pro CentOS Docker 部署脚本
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ---- 步骤 1: 环境检查 ----
info "检查环境..."
command -v docker &>/dev/null || error "Docker 未安装: 请先安装 Docker"
docker compose version &>/dev/null || error "Docker Compose V2 插件未安装: 请安装 docker-compose-plugin"
command -v git &>/dev/null || error "Git 未安装: yum install -y git"
command -v java &>/dev/null || error "JDK 未安装: 需 JDK 17+ 用于构建后端"

# ---- 步骤 2: 构建后端 JAR ----
info "构建后端 JAR..."
if [ ! -f "yudao-server/target/yudao-server.jar" ]; then
    mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4
    info "后端构建完成"
else
    warn "后端 JAR 已存在，跳过构建。如需重新构建请删除 yudao-server/target/yudao-server.jar"
fi

# ---- 步骤 3: 克隆前端 ----
if [ ! -d "yudao-ui-admin" ]; then
    info "克隆前端项目..."
    git clone https://github.com/yudaocode/yudao-ui-admin-vue3.git yudao-ui-admin
else
    warn "前端目录已存在，跳过克隆"
fi

# ---- 步骤 4: 导出/准备数据库初始化 SQL ----
if [ ! -f "sql/init-schema.sql" ]; then
    warn "sql/init-schema.sql 不存在，请手动从现有 MySQL 导出："
    warn "  mysqldump -u root --no-data ruoyi-vue-pro > sql/init-schema.sql"
    warn "跳过此步，容器启动时如果数据库为空会报错"
fi

# ---- 步骤 6: 开放防火墙端口 ----
info "开放防火墙端口..."
if command -v firewall-cmd &>/dev/null; then
    firewall-cmd --permanent --add-port=48080/tcp 2>/dev/null || true
    firewall-cmd --permanent --add-port=8080/tcp 2>/dev/null || true
    firewall-cmd --reload 2>/dev/null || true
else
    warn "firewall-cmd 不可用，请手动开放端口 48080 和 8080"
fi

# ---- 步骤 7: 启动 Docker Compose ----
info "启动 Docker Compose..."
docker compose --env-file .env up -d

# ---- 步骤 8: 健康检查 ----
info "等待服务启动..."
for i in $(seq 1 24); do
    sleep 5
    if curl -sf http://localhost:48080/actuator/health >/dev/null 2>&1; then
        info "后端服务已就绪: http://localhost:48080"
        break
    fi
done

if curl -sf http://localhost:8080 >/dev/null 2>&1; then
    info "前端服务已就绪: http://localhost:8080"
else
    warn "前端服务未在 30 秒内就绪，请手动检查: docker compose logs admin"
fi

info "=========================================="
info "部署完成！"
info "后端 API: http://your-server-ip:48080"
info "管理后台: http://your-server-ip:8080"
info "=========================================="
```

- [ ] **Step 2: 验证文件**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\setup.sh"`

---

### Task 7: 创建 Opencode Skill（docker/deploy-skill.md）

**Files:**
- Create: `D:\opencodeproject\ruoyi-vue-pro\docker\deploy-skill.md`

- [ ] **Step 1: 编写 deploy-skill.md**

```markdown
# RuoYi-Vue-Pro CentOS Docker 部署 Skill

## 用途
指导 opencode 在 CentOS 服务器上使用 Docker 部署 ruoyi-vue-pro 全栈项目。

## 前提条件

### 服务器要求
- CentOS 7+ / Rocky Linux 8+
- Docker 24+（安装: `yum install -y docker-ce docker-ce-cli containerd.io`）
- Docker Compose V2 插件（安装: `yum install -y docker-compose-plugin`）
- Git（安装: `yum install -y git`）
- JDK 17+（安装: `yum install -y java-17-openjdk-devel`）
- 最低配置: 2 核 CPU / 4G 内存 / 20G 磁盘

### 网络要求
- 防火墙开放 48080（后端 API）和 8080（管理后台）端口
- 如需外部访问 3306（MySQL）和 6379（Redis），需额外开放
- SE Linux 建议设置为 permissive 或配置正确 context

## 部署流程

### 1. 项目准备
```bash
# 克隆项目并进入目录
git clone https://github.com/leangjia/ruoyi-vue-pro.git
cd ruoyi-vue-pro
```

### 2. 一键部署
```bash
# 给脚本执行权限
chmod +x setup.sh
# 执行一键部署
./setup.sh
```

### 3. 手动部署（分步）

#### 3.1 构建后端
```bash
# 使用 Maven 构建
mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4
```

#### 3.2 准备前端
```bash
# 克隆前端项目
git clone https://github.com/yudaocode/yudao-ui-admin-vue3.git yudao-ui-admin
# 构建前端 Docker 镜像时会自动执行 npm install && npm run build
```

#### 3.3 配置环境变量
```bash
# 编辑 .env 文件，按需修改
# 关键配置：
#   MYSQL_ROOT_PASSWORD - 数据库密码
#   SPRING_PROFILES_ACTIVE - Spring profile（local/dev/prod）
```

#### 3.4 启动服务
```bash
docker compose --env-file .env up -d
```

#### 3.5 检查状态
```bash
# 查看所有服务状态
docker compose ps
# 查看日志
docker compose logs -f server
docker compose logs -f admin
# 健康检查
curl http://localhost:48080/actuator/health
```

## 常用操作

### 停止服务
```bash
docker compose down
```

### 重启单个服务
```bash
docker compose restart server
```

### 查看日志
```bash
docker compose logs -f --tail=100 server
```

### 更新部署
```bash
# 拉取最新代码
git pull

# 重新构建后端
mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4

# 重新构建前端镜像
docker compose build admin

# 重新创建并启动容器
docker compose up -d --force-recreate
```

## 故障排查

### 问题: 后端无法连接到 MySQL
**原因**: MySQL 容器启动较慢，后端先于 MySQL 就绪
**解决**: `depends_on` + `condition: service_healthy` 已配置，等待几秒即可

### 问题: 前端页面白屏 / 404
**原因 1**: nginx 配置中 `location /prod-api/` 的 proxy_pass 路径错误
**解决**: 确保 proxy_pass 末尾有 `/`（去除匹配路径前缀）

**原因 2**: Vue 构建时 `VUE_APP_BASE_API` 与 nginx 配置不匹配
**解决**: 确保 `VUE_APP_BASE_API=/prod-api` 与 nginx 的 `location /prod-api/` 一致

### 问题: 数据库连接拒绝
**原因**: MySQL 端口被占用或认证信息错误
**解决**: 
1. `docker compose logs mysql` 查看 MySQL 日志
2. 检查 `.env` 中的 MYSQL_ROOT_PASSWORD
3. `docker compose down -v` 清理 volume 后重新启动

### 问题: 端口被占用
```bash
# 检查端口占用
ss -tlnp | grep -E '48080|8080|3306|6379'
# 在 .env 中修改端口映射
```

### 问题: CentOS firewalld 限制
```bash
# 开放端口
firewall-cmd --permanent --add-port=48080/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload
```

### 问题: SE Linux 阻止
```bash
# 临时设置为 permissive
setenforce 0
# 永久设置（编辑 /etc/selinux/config）
# SELINUX=permissive
```

## 数据备份

### 备份 MySQL 数据
```bash
docker exec yudao-mysql mysqldump -u root -p123456 ruoyi-vue-pro > backup.sql
```

### 备份整个 Docker volume
```bash
docker run --rm -v mysql-data:/source -v $(pwd):/backup alpine tar czf /backup/mysql-data-backup.tar.gz -C /source .
```

## 安全建议

1. 修改默认密码（.env 中的 MYSQL_ROOT_PASSWORD）
2. 生产环境使用 `spring.profiles.active=prod`，不暴露调试信息
3. 配置 HTTPS（在 nginx 中添加 SSL 证书配置）
4. 限制 Docker 容器资源使用（在 docker-compose.yml 中添加 `deploy.resources.limits`）
5. 定期备份数据库
```

- [ ] **Step 2: 验证文件**

Run: `Test-Path "D:\opencodeproject\ruoyi-vue-pro\docker\deploy-skill.md"`

---

### Task 8: 最终验证

- [ ] **Step 1: 确认所有文件已创建**

```bash
$files = @(
    "docker-compose.yml",
    "nginx/default.conf",
    ".env",
    "yudao-ui-admin/Dockerfile",
    "sql/init-database.sql",
    "sql/init-schema.sql",
    "sql/init-data.sql",
    "setup.sh",
    "docker/deploy-skill.md"
)
foreach ($f in $files) {
    $p = "D:\opencodeproject\ruoyi-vue-pro\$f"
    if (Test-Path $p) { Write-Output "OK  $f" } else { Write-Output "MISS $f" }
}
```
