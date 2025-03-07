@echo off
REM 设置命令行代码页为 UTF-8，以防止中文乱码
chcp 65001

REM MinIO 启动脚本

REM 设置 MinIO 安装路径
set MINIO_PATH="D:\mylog\Minio\bin"

REM 设置数据存储目录
set DATA_DIR="D:\mylog\Minio\data"

REM 设置 MinIO 端口和其他配置
set MINIO_CONSOLE_ADDR="127.0.0.1:9000"
set MINIO_SERVER_ADDR="127.0.0.1:9005"


REM 启动 MinIO
cd /d %MINIO_PATH%
.\minio.exe server %DATA_DIR% --console-address %MINIO_CONSOLE_ADDR% --address %MINIO_SERVER_ADDR%

REM 提示信息
echo MinIO 已启动，访问地址：http://%MINIO_SERVER_ADDR% 或 http://%MINIO_CONSOLE_ADDR%（控制台）

pause

