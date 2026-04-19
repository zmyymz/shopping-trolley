# Shopping Cart - JSP 购物车系统

一个基于 JSP + Servlet + MySQL 实现的在线购物车系统。

## 技术栈

- **前端**: JSP, HTML, CSS, JavaScript, jQuery, AmazeUI
- **后端**: Java Servlet, JDBC
- **数据库**: MySQL 5.7
- **服务器**: Apache Tomcat 9.0
- **开发工具**: Eclipse / IntelliJ IDEA

## 项目结构

```
shopping-trolley/
├── src/                      # Java 源代码
│   ├── dao/                  # 数据访问层
│   │   ├── BaseDao.java      # 数据库连接基类
│   │   └── ProductDaoImp.java # 商品 DAO 实现
│   └── entity/               # 实体类
│       ├── Product.java      # 商品实体
│       └── CartItem.java     # 购物车项实体
├── WebContent/               # Web 资源
│   ├── index.jsp            # 首页
│   ├── cart.jsp             # 购物车页面
│   ├── detail.jsp           # 商品详情页
│   ├── login.jsp            # 登录页
│   ├── doCart.jsp           # 添加购物车处理
│   └── doDeleteCart.jsp     # 删除购物车项处理
├── sql/                      # 数据库脚本
│   └── ShopCart.sql         # 数据库初始化脚本
└── out/                      # 编译输出
```

## 环境要求

- **JDK**: 1.8+
- **MySQL**: 5.7+（推荐使用 USBWebserver，便携免安装）
- **Tomcat**: 9.0+
- **IDE**: Eclipse 或 IntelliJ IDEA

## 数据库配置

### 推荐工具：USBWebserver

[USBWebserver](https://www.usbwebserver.net/) 是一个绿色便携的集成环境，内置 Apache + PHP + MySQL，无需安装，解压即用，非常适合本项目的本地开发调试。

1. 下载并解压 USBWebserver
2. 启动后点击 **phpMyAdmin** 进入数据库管理界面
3. 新建数据库 `shop`，导入 `sql/ShopCart.sql`

> 如果已有 MySQL，也可跳过此步骤直接使用命令行导入。

### 1. 初始化数据库

在 MySQL 中执行 `sql/ShopCart.sql` 文件:

```bash
mysql -u root -p < sql/ShopCart.sql
```

或使用 MySQL 客户端工具（Navicat、DBeaver、phpMyAdmin 等）导入该 SQL 文件。

### 2. 修改数据库连接

编辑 `src/dao/BaseDao.java` 中的数据库连接配置:

```java
String url = "jdbc:mysql://localhost:3306/shop";
connection = DriverManager.getConnection(url, "root", "password");
```

将 `password` 替换为你的 MySQL 密码。

### 数据库表说明

- **product**: 商品表
  - `id`: 商品ID（自增主键）
  - `name`: 商品名称
  - `price`: 商品价格
  - `desc`: 商品描述
  - `num`: 库存数量
  - `img`: 商品图片文件名

- **user**: 用户表
  - `username`: 用户名（主键）
  - `password`: 密码

默认测试账号：
- 用户名: `admin` / 密码: `123`
- 用户名: `aaa` / 密码: `123`

## IDE 导入与运行

### 方式一：Eclipse 导入（推荐）

#### 1. 导入项目

1. 打开 Eclipse
2. 选择 `File → Import`
3. 展开 `General` 文件夹，选择 `Existing Projects into Workspace`
4. 点击 `Next`
5. 点击 `Browse`，选择项目根目录 `shopping-trolley`
6. 勾选该项目，点击 `Finish`

#### 2. 配置 Tomcat 服务器

1. 打开 `Window → Preferences`
2. 展开 `Server → Runtime Environments`
3. 点击 `Add`
4. 选择 `Apache Tomcat v9.0`，点击 `Next`
5. 点击 `Browse`，选择 Tomcat 安装目录（如 `D:\apache-tomcat-9.0.x`）
6. 点击 `Finish` 完成配置

#### 3. 部署并运行

1. 右键项目 → `Properties`
2. 选择 `Project Facets`
3. 勾选 `Dynamic Web Module` 和 `Java`
4. 在 `Runtime` 选项卡中勾选刚配置的 Tomcat
5. 点击 `Apply and Close`
6. 右键项目 → `Run As → Run on Server`
7. 选择 Tomcat 服务器，点击 `Finish`
8. 浏览器访问: `http://localhost:8080/shopping-trolley/`

#### 4. 修改项目上下文路径（可选）

1. 右键项目 → `Properties`
2. 选择 `Web Project Settings`
3. 修改 `Context root` 为 `/shopping` 或你想要的名称
4. 点击 `Apply`

---

### 方式二：IntelliJ IDEA 导入

#### 1. 导入项目

1. 打开 IntelliJ IDEA
2. 选择 `File → New → Project from Existing Sources`
3. 选择项目根目录 `shopping-trolley`
4. 选择 `Create project from existing sources`，点击 `Next`
5. 保持默认设置，一直点击 `Next` 直到完成

**或者使用 Open 方式:**

1. `File → Open`，选择项目根目录
2. IDEA 会自动识别为 Web 项目

#### 2. 配置 Tomcat 服务器

1. 点击顶部工具栏的 `Add Configuration`（或 `Run → Edit Configurations`）
2. 点击 `+` 号，选择 `Tomcat Server → Local`
3. 点击 `Configure`，选择 Tomcat 安装目录
4. 在 `Application server` 中选择配置好的 Tomcat

#### 3. 配置 Deployment

1. 切换到 `Deployment` 选项卡
2. 点击 `+` 号，选择 `Artifact`
3. 选择 `shopping-trolley:war exploded`
4. 设置 `Application context` 为 `/shopping`
5. 点击 `Apply`

#### 4. 添加依赖库

1. `File → Project Structure`（或 `Ctrl+Alt+Shift+S`）
2. 选择 `Modules` → 选择 `shopping-trolley`
3. 切换到 `Dependencies` 选项卡
4. 点击 `+` → `JARs or directories`
5. 添加 `WebContent/WEB-INF/lib/mysql-connector-java-5.1.19-bin.jar`
6. 点击 `Apply`

#### 5. 运行项目

1. 点击绿色的 `Run` 按钮（或 `Shift+F10`）
2. IDEA 会启动 Tomcat 并自动部署项目
3. 浏览器访问: `http://localhost:8080/shopping/`

---

### 方式三：手动部署到 Tomcat

如果不想使用 IDE，可以手动部署:

#### 1. 编译 Java 文件

```bash
cd shopping-trolley
javac -encoding UTF-8 -cp "WebContent/WEB-INF/lib/*" -d out/production/classes src/dao/*.java src/entity/*.java
```

#### 2. 部署到 Tomcat

```bash
# 复制编译后的文件到 Tomcat webapps 目录
copy /Y out\artifacts\shopping\* D:\apache-tomcat-9.0.x\webapps\shopping\

# 或使用 PowerShell (Windows)
Copy-Item -Path "out\artifacts\shopping\*" -Destination "D:\apache-tomcat-9.0.x\webapps\shopping" -Recurse -Force
```

#### 3. 启动 Tomcat

```bash
# Windows
cd D:\apache-tomcat-9.0.x\bin
startup.bat

# Linux/Mac
cd /path/to/apache-tomcat-9.0.x/bin
./startup.sh
```

#### 4. 访问应用

打开浏览器访问: `http://localhost:8080/shopping/`

## 主要功能

- ✅ 商品浏览与搜索
- ✅ 商品详情查看
- ✅ 添加商品到购物车
- ✅ 购物车管理（增加/减少数量、删除商品）
- ✅ 实时价格计算
- ✅ 库存检查与限制
- ✅ 用户登录/注册
- ✅ 响应式设计（支持移动端）

## 更新日志

### v1.1.0 (2026-04-03)

- 🐛 修复购物车空指针异常
- 🐛 修复前端价格累加逻辑错误
- 🐛 修复删除商品时的空指针问题
- 🔒 添加库存检查和数量限制
- 🔒 修复 SQL 注入漏洞（使用 PreparedStatement）
- 🔒 添加参数验证和错误处理
- ✨ 优化购物车总价计算
- ✨ 改进空购物车显示

### v1.0.0

- 初始版本发布
- 基本的购物车功能实现

## 常见问题

### 1. 启动时报 "Address already in use: bind" 错误

**原因**: 8080 端口被占用

**解决方法**:
```bash
# Windows 查看占用 8080 端口的进程
netstat -ano | findstr :8080

# 结束占用进程（替换 PID）
taskkill /F /PID <进程ID>

# 或者修改 Tomcat 端口
# 编辑 Tomcat/conf/server.xml，将 8080 改为其他端口（如 8090）
```

### 2. 数据库连接失败

**检查项**:
- MySQL 服务是否已启动
- `BaseDao.java` 中的数据库连接配置是否正确
- 数据库 `shop` 是否已创建
- 用户名和密码是否正确

### 3. 页面显示乱码

**解决方法**:
- 确保所有 JSP 文件头部包含 `pageEncoding="UTF-8"`
- Tomcat 的 `server.xml` 中配置 URI 编码:
  ```xml
  <Connector port="8080" URIEncoding="UTF-8" />
  ```

### 4. 添加购物车后商品数量为 0 或负数

已修复！v1.1.0 版本添加了库存检查和数量限制，数量减少到 1 以下时会提示删除商品。

## 许可证

本项目仅供学习参考使用。