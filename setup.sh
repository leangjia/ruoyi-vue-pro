#!/bin/bash
set -euo pipefail

# ============================================================
# RuoYi-Vue-Pro CentOS Docker 一键部署脚本
# 用法: chmod +x setup.sh && ./setup.sh
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

# ---- 环境检查 ----
info "检查环境..."
command -v docker &>/dev/null || error "Docker 未安装: 请先安装 Docker"
docker compose version &>/dev/null || error "Docker Compose V2 插件未安装: 请安装 docker-compose-plugin"
command -v git &>/dev/null || error "Git 未安装: yum install -y git"
command -v java &>/dev/null || error "JDK 未安装: yum install -y java-17-openjdk-devel"
command -v mvn &>/dev/null && info "Maven: $(mvn --version 2>&1 | head -1)" || warn "Maven 未安装，将使用系统 mvn"

# ---- 构建后端 JAR ----
info "构建后端 JAR..."
if [ ! -f "yudao-server/target/yudao-server.jar" ]; then
    mvn clean package -Dmaven.test.skip=true -Dmaven.javadoc.skip=true -pl yudao-server -am -T 4
    info "后端构建完成"
else
    warn "后端 JAR 已存在，跳过构建。如需重新构建请删除 yudao-server/target/yudao-server.jar"
fi

# ---- 克隆前端 ----
if [ ! -d "yudao-ui-admin" ]; then
    info "克隆前端项目..."
    git clone https://github.com/yudaocode/yudao-ui-admin-vue3.git yudao-ui-admin
    info "前端克隆完成"
else
    warn "前端目录已存在，跳过克隆"
fi

# ---- 开放防火墙端口 ----
info "开放防火墙端口..."
if command -v firewall-cmd &>/dev/null; then
    firewall-cmd --permanent --add-port=48080/tcp 2>/dev/null || true
    firewall-cmd --permanent --add-port=8080/tcp 2>/dev/null || true
    firewall-cmd --reload 2>/dev/null || true
    info "防火墙端口 48080, 8080 已开放"
else
    warn "firewall-cmd 不可用，请手动开放端口 48080 和 8080"
fi

# ---- 启动 Docker Compose ----
info "启动 Docker Compose..."
docker compose --env-file .env up -d

# ---- 健康检查 ----
info "等待后端服务启动..."
BACKEND_READY=false
for i in $(seq 1 24); do
    sleep 5
    if curl -sf http://localhost:48080/actuator/health >/dev/null 2>&1; then
        BACKEND_READY=true
        info "后端服务已就绪: http://localhost:48080"
        break
    fi
done

if [ "$BACKEND_READY" = false ]; then
    warn "后端服务未在 120 秒内就绪，请手动检查: docker compose logs server"
fi

info "等待前端服务启动..."
FRONTEND_READY=false
for i in $(seq 1 12); do
    sleep 5
    if curl -sf http://localhost:8080 >/dev/null 2>&1; then
        FRONTEND_READY=true
        info "前端服务已就绪: http://localhost:8080"
        break
    fi
done

if [ "$FRONTEND_READY" = false ]; then
    warn "前端服务未在 60 秒内就绪，请手动检查: docker compose logs admin"
fi

# ---- 完成 ----
info "=========================================="
info "部署完成！"
info "后端 API: http://<your-server-ip>:48080"
info "管理后台: http://<your-server-ip>:8080"
info "默认账号: admin / admin123"
info "=========================================="
info ""
info "常用命令:"
info "  查看日志: docker compose logs -f server"
info "  停止服务: docker compose down"
info "  重启服务: docker compose restart"
info "=========================================="
