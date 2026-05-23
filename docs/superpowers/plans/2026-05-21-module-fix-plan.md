# 修复计划：10 个模块报错问题

## 根因分析

**所有模块后端代码和依赖均已就位（jar 包包含），但数据库缺少对应模块的物理表。** Maven 编译和启动正常，运行时因表缺失抛出异常，经框架捕获后转为 501 "已禁用" 或 500 服务器错误。

### 各模块问题明细

| # | 模块 | 当前报错 | 错误来源 | 根因 |
|---|------|---------|---------|------|
| 1 | 支付管理 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `pay_*` 表 |
| 2 | 报表管理 | 数据库连接异常 | JimuReport 自身异常捕获 | 缺少 `jimu_report/*`、`onl_drag_*` 表 |
| 3 | 工作流程 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `bpm_*` 表（已确认 `bpm_category` 不存在） |
| 4 | 会员中心 | 500 服务器错误 | `GlobalExceptionHandler` 无 `member_` 分支 | 缺少 `member_*` 表 + 框架未处理 `member_` 前缀 |
| 5 | 商城系统 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `product_*`、`promotion_*`、`trade_*` 表 |
| 6 | 公众号管理 | 501 已禁用 + "表结构未导入" 轮询报错 | 两者都有 | 缺少 `mp_*` 表 |
| 7 | CRM系统 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `crm_*` 表 |
| 8 | AI大模型 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `ai_*` 表 |
| 9 | IOT物联网 | 501 已禁用 | `DefaultController` 兜底 | 缺少 `iot_*` 表 + TDengine 配置 |
| 10 | IM即时通讯 | 白屏 | 前端路由指向不存在的后端模块 | 本项目不包含 IM 模块（另独立项目） |

### 机制原理

ruoyi-vue-pro 有三层模块禁用检测机制，按顺序：

1. **BannerApplicationRunner**（启动时）：检查配置类是否在 classpath → 本项目所有模块均已通过
2. **DefaultController**（路由匹配兜底）：未匹配到控制器的请求返回 501 "已禁用"
3. **GlobalExceptionHandler.handleTableNotExists**（SQL 异常）：捕获 `Table doesn't exist` 并转换为 501 "表结构未导入"

第 2 层是当前主要返回路径——因为控制器注册了但首次查询即失败，异常处理将错误格式化为 501。

---

## 修复计划

### 阶段一：自动生成 DDL SQL（所有模块）

为每个模块扫描实体类，自动生成 `CREATE TABLE IF NOT EXISTS` DDL：

- **模块 → 表前缀**
  - pay → `pay_*`
  - bpm → `bpm_*`
  - member → `member_*`  
  - product → `product_*`
  - promotion → `promotion_*`
  - trade → `trade_*`
  - mp → `mp_*`
  - crm → `crm_*`
  - erp → `erp_*`
  - ai → `ai_*`
  - iot → `iot_*`
  - report → `jimu_report/*`, `onl_drag_*`（JimuReport 第三方表）

**方法**：为每个模块编写 PowerShell 脚本，读取实体类或使用 MyBatis-Plus AutoGenerator 扫描 DO 类生成 DDL，执行到 MySQL。

### 阶段二：Members 模块修复（500 错误）

会员中心返回 500 而非 501，因为 `GlobalExceptionHandler.handleTableNotExists()` 缺少 `member_` 前缀检查。

**修改文件：** `yudao-framework/yudao-spring-boot-starter-web/src/main/java/cn/iocoder/yudao/framework/web/core/handler/GlobalExceptionHandler.java`

添加分支（参考现有模式）：
```java
if (message.contains("member_")) {
    log.error("[会员中心 yudao-module-member - 表结构未导入][参考 https://doc.iocoder.cn/member/build/ 开启]");
    return CommonResult.error(NOT_IMPLEMENTED.getCode(),
            "[会员中心 yudao-module-member - 表结构未导入][参考 https://doc.iocoder.cn/member/build/ 开启]");
}
```

### 阶段三：报表 JimuReport 配置修复

JimuReport 使用独立数据源（自动配置从 `application-local.yaml` 读取 `spring.datasource.dynamic.datasource.master`），但其自身系统表缺失。

**需要创建的表：**
- `jimu_report` / `jimu_report_data_source` / `jimu_report_db` / `jimu_report_db_field` / `jimu_report_db_param` / `jimu_report_map` / `jimu_report_link` / `jimu_report_share` / `jimu_report_category` / `jimu_report_dict` / `jimu_report_dict_item` / `jimu_report_sheet` / `jimu_report_export_job` / `jimu_report_export_log` / `jimu_report_ext_data` / `jimu_report_image`
- `onl_drag_page` / `onl_drag_page_comp` / `onl_drag_comp` / `onl_drag_dataset_head` / `onl_drag_dataset_item` / `onl_drag_dataset_param` / `onl_drag_data_source` / `onl_drag_share`
- `jimu_icon_lib` / `jimu_report_data_set`
- 报表相关视图

**方法：**
1. 从 JimuReport 官方 SQL 提取 DDL
2. 或启动时设置 `jeecg: table-auto-create: true` 让 JimuReport 自动建表
3. 配置额外数据源属性

### 阶段四：IoT TDengine 禁用 + 模拟配置

IoT 模块强依赖 TDengine。在不安装 TDengine 的情况下：
1. 确认 `application-local.yaml` 中已设 `yudao.iot.tdengine.enabled=false`
2. 确认已设 `yudao.iot.message-bus.type=local`
3. IoT 业务表仍需创建到 MySQL（IoT 配置/设备管理表）

### 阶段五：IM 即时通讯白屏修复

**问题：** 本项目不包含 IM 模块（`yudao-module-im` 不存在），前端 `yudao-ui-admin` 菜单配置中引用了 `/im` 路由导致白屏。

**修复方法：**
1. 检查前端 `src/router/` 和 `src/router/modules/` 中的 IM 路由配置
2. 注释或删除 IM 菜单路由
3. 或在后端新增一个 IM 占位路由返回 501

### 阶段六：验证

对每个模块执行接口冒烟测试，确认：
1. 模块管理页面（列表/创建/编辑）可正常访问
2. 核心 CRUD 接口返回 200 而非 501/500
3. 切换租户后模块仍可用

---

## 风险

| 风险 | 影响 | 缓解 |
|------|------|------|
| DDL 不全或遗漏字段 | 部分功能接口 500 | 对比实体类逐一生成 |
| JimuReport 版本差异 | 自动建表失败 | 使用 JimuReport 2.3.2 对应 SQL |
| IoT 强依赖 TDengine | IoT 模块功能不可用 | 先保证模块不报错，TDengine 后续再接入 |
| IM 前端删除路由后重新出现 | 下次拉代码又被还原 | 需在 `AGENTS.md` 记录 |
| OOM 风险（之前发生过） | 服务器进程退出 | 手动 GC 或加大堆内存 |
