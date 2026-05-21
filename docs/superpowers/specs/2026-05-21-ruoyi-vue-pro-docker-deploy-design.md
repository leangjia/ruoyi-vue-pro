# RuoYi-Vue-Pro CentOS Docker 部署设计

## 概述

在 CentOS 服务器上使用 Docker 部署 ruoyi-vue-pro 全栈项目（后端 Spring Boot + 前端 Vue3 + MySQL + Redis + Nginx）。

## 文件结构

```
ruoyi-vue-pro/
├── docker-compose.yml        # 主编排文件
├── .env                      # 环境变量
├── setup.sh                  # CentOS 一键部署脚本
├── nginx/
│   └── default.conf          # Nginx 静态文件 + API 反向代理
├── sql/
│   ├── init-database.sql     # 建库脚本
│   ├── init-schema.sql       # 全量表结构
│   └── init-data.sql         # 基础数据（菜单、字典、配置）
└── docker/
    └── deploy-skill.md       # Opencode 技能
```

## 服务定义

### 1. mysql (MySQL 8.0)

- 镜像: `mysql:8.0`
- 端口: `3306:3306`
- Volume: `mysql-data:/var/lib/mysql`
- 挂载: `./sql/init-database.sql` → `/docker-entrypoint-initdb.d/`
- 环境变量: `MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE`
- 健康检查: `mysqladmin ping`

### 2. redis (Redis 7.0)

- 镜像: `redis:7-alpine`
- 端口: `6379:6379`
- Volume: `redis-data:/data`
- 健康检查: `redis-cli ping`

### 3. server (Java 后端)

- 构建: 使用已有的 `yudao-server/Dockerfile`（`eclipse-temurin:21-jre`）
- 端口: `48080:48080`
- 依赖: mysql (healthy), redis (healthy)
- 环境变量覆盖 application-local.yaml:
  - `MASTER_DATASOURCE_URL`: jdbc:mysql://mysql:3306/ruoyi-vue-pro
  - `MASTER_DATASOURCE_USERNAME`: root
  - `MASTER_DATASOURCE_PASSWORD`: ${MYSQL_ROOT_PASSWORD}
  - `REDIS_HOST`: redis
- JVM: `-Xms512m -Xmx512m`

### 4. admin (Vue3 前端 + Nginx)

- 构建: 两阶段 Dockerfile
  - Stage 1 (build): `node:20-alpine` → `npm install && npm run build`
  - Stage 2 (serve): `nginx:alpine` → 复制 dist → 复制 nginx.conf
- 端口: `8080:80`
- 依赖: server
- 构建参数: `VUE_APP_BASE_API=/prod-api`

### 网络

- 所有服务在 `ruoyi-network`（bridge）内部网络中
- 服务间通过服务名互相访问

## Nginx 配置

```nginx
server {
    listen 80;
    root /usr/share/nginx/html;
    index index.html;

    location /prod-api/ {
        proxy_pass http://server:48080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

## 环境变量 (.env)

```bash
MYSQL_ROOT_PASSWORD=123456
MYSQL_DATABASE=ruoyi-vue-pro
SPRING_PROFILES_ACTIVE=local
SERVER_PORT=48080
ADMIN_PORT=8080
```

## 部署脚本 (setup.sh)

1. **环境检查**: 确认 Docker、docker-compose（或 docker compose）、Git 已安装
2. **克隆前端源码**: `git clone https://github.com/yudaocode/yudao-ui-admin-vue3.git ./yudao-ui-admin`
3. **创建前端 Dockerfile**: 在 `./yudao-ui-admin/Dockerfile` 写入多阶段构建配置
4. **构建后端 JAR**: `mvn clean package -Dmaven.test.skip=true -pl yudao-server -am`
5. **导出数据库**: `mysqldump -u root --no-data ruoyi-vue-pro > sql/init-schema.sql && mysqldump -u root ruoyi-vue-pro [业务表列表] > sql/init-data.sql`
6. **启动**: `docker compose --env-file .env up -d`
7. **健康检查**: 轮询 `http://localhost:48080/actuator/health` 和 `http://localhost:8080`

## Opencode Skill (docker/deploy-skill.md)

- **Purpose**: 指导 opencode 在 CentOS 上 Docker 部署 ruoyi-vue-pro
- **Prerequisites**: Docker 24+, docker compose plugin, Git, 2核4G+
- **Checklist**:
  1. 环境准备
  2. 后端构建
  3. 前端构建
  4. 数据库初始化
  5. 启动验证
  6. 故障排查
- **Troubleshooting**: 端口冲突、MySQL 连接拒绝、前端白屏/404、防火墙/SE Linux

## CentOS 注意事项

- firewall-cmd 开放 48080 和 8080 端口
- SE Linux 可能需要设置为 permissive 或配置正确 context
- Docker 使用 `docker compose`（v2 插件形式），确保已安装 `docker-compose-plugin`
- 数据目录建议放在有足够空间的分区

## 实施顺序

1. 创建 `docker-compose.yml`
2. 创建 `nginx/default.conf`
3. 创建 `.env`
4. 创建前端多阶段 Dockerfile（集成到 admin 服务或独立文件）
5. 从当前 MySQL 导出 `sql/init-schema.sql` 和 `sql/init-data.sql`
6. 创建 `setup.sh`
7. 创建 `docker/deploy-skill.md`
