@echo off
chcp 65001 >nul 2>&1
echo ============================================================
echo 衣服污渍检测系统 - 快速启动
echo 大创团队 - Stain Detection Project
echo ============================================================
echo.

REM 检查 Python 是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未检测到 Python，请先安装 Python 3.8+
    echo 💡 下载地址: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [✓] Python 环境检测成功
echo.

REM 检查数据文件夹是否存在
if not exist "data\Clothes_Samples" (
    echo ❌ 错误: 未找到 data\Clothes_Samples\ 文件夹
    echo 💡 提示: 请将衣服图片放入 data\Clothes_Samples\ 文件夹
    echo.
    pause
    exit /b 1
)

echo [✓] 数据文件夹检测成功
echo.

REM 检查是否有图像文件
dir /b "data\Clothes_Samples\*.jpg" >nul 2>&1
if errorlevel 1 (
    echo ⚠️  警告: Clothes_Samples 文件夹中没有找到 .jpg 图像
    echo.
)

REM 创建输出文件夹（如果不存在）
if not exist "output" (
    mkdir output
    echo [✓] 已创建 output 文件夹
)

echo ============================================================
echo 开始运行衣服污渍检测程序...
echo ============================================================
echo.

REM 运行主程序
python src\demo.py

echo.
echo ============================================================
echo 程序执行完成！
echo 📁 请查看 output\ 文件夹获取处理结果
echo ============================================================
echo.

pause
