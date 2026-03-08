#!/bin/bash

# 设置Java 21
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@21/21.0.10/libexec/openjdk.jdk/Contents/Home

# 进入脚本所在目录
cd "$(dirname "$0")"

# 检查JAR文件是否存在
JAR_FILE="target/dormitory-manage-0.0.3-SNAPSHOT.jar"
if [ ! -f "$JAR_FILE" ]; then
    echo "错误: JAR文件不存在: $JAR_FILE"
    echo "请先运行: mvn clean package -DskipTests"
    exit 1
fi

# 检查MySQL是否运行
if ! mysqladmin -u root -p11111111 ping > /dev/null 2>&1; then
    echo "错误: MySQL服务未运行"
    echo "请启动MySQL: brew services start mysql"
    exit 1
fi

# 检查dm数据库是否存在
if ! mysql -u root -p11111111 -e "USE dm;" > /dev/null 2>&1; then
    echo "错误: dm数据库不存在"
    echo "请执行SQL初始化脚本: src/main/resources/init.sql"
    exit 1
fi

echo "启动宿舍管理系统..."
echo "访问地址: http://localhost:8080"
echo "默认账号: admin/admin"
echo "按Ctrl+C停止应用"

# 运行Spring Boot应用
java -jar "$JAR_FILE"