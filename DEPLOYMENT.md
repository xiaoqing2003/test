# 宿舍管理系统部署说明

## 环境要求
- macOS (M1芯片)
- MySQL 8.0+ (密码: 11111111)
- Java 21
- Maven 3.9+

## 已完成的部署步骤

1. **项目克隆**: 已从GitHub克隆到 `/Users/xiaoqing/dome`
2. **数据库初始化**:
   - 已创建 `dm` 数据库
   - 已执行SQL初始化脚本，包含表结构和初始数据
3. **项目构建**: 已使用Maven构建项目，生成JAR文件
4. **环境验证**: MySQL服务已运行，Java 21已安装

## 快速启动

### 方法1: 使用启动脚本
```bash
cd /Users/xiaoqing/dome
./start.sh
```

### 方法2: 手动启动
```bash
cd /Users/xiaoqing/dome
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@21/21.0.10/libexec/openjdk.jdk/Contents/Home
java -jar target/dormitory-manage-0.0.3-SNAPSHOT.jar
```

## 访问应用
- 地址: http://localhost:8080
- 默认登录账号: `admin` / `admin`

## 数据库信息
- 主机: 127.0.0.1:3306
- 数据库名: `dm`
- 用户名: `root`
- 密码: `11111111`

## 项目结构
```
/Users/xiaoqing/dome/
├── src/                    # 源代码
├── target/                 # 构建输出
│   └── dormitory-manage-0.0.3-SNAPSHOT.jar
├── pom.xml                # Maven配置
├── start.sh               # 启动脚本
└── README.md              # 本文件
```

## 管理命令

### 启动MySQL服务
```bash
brew services start mysql
```

### 停止MySQL服务
```bash
brew services stop mysql
```

### 重新构建项目
```bash
cd /Users/xiaoqing/dome
mvn clean package -DskipTests
```

## 注意事项
1. 确保MySQL服务在启动应用前已运行
2. 如果修改了数据库密码，需要更新 `src/main/resources/application.yml`
3. 应用日志会显示在控制台，包含数据库连接信息

## 故障排除

### 1. 端口冲突
如果8080端口被占用，修改 `src/main/resources/application.yml` 中的 `server.port`

### 2. 数据库连接失败
检查MySQL服务状态:
```bash
brew services list | grep mysql
```

检查数据库是否存在:
```bash
mysql -u root -p11111111 -e "SHOW DATABASES;"
```

### 3. Java版本问题
确保使用Java 21:
```bash
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@21/21.0.10/libexec/openjdk.jdk/Contents/Home
java -version
```