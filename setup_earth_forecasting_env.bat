@echo off
REM Earth Forecasting Transformer - Conda 环境配置脚本 (Windows)
REM 使用方法：双击运行此文件，或在命令行执行：setup_earth_forecasting_env.bat

echo =========================================
echo Earth Forecasting Transformer
echo Conda 环境配置脚本
echo =========================================

REM 设置环境名称
set ENV_NAME=earth_forecasting

REM 设置环境安装路径（可选，如果使用默认路径请注释掉）
REM set ENV_PREFIX=C:\conda_envs\earth_forecasting

REM 检查 conda 是否安装
where conda >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 错误: 未找到 conda 命令，请先安装 Anaconda 或 Miniconda
    pause
    exit /b 1
)

echo.
echo 步骤 1: 创建 Conda 虚拟环境...

REM 如果设置了自定义路径，使用 --prefix，否则使用默认路径
if defined ENV_PREFIX (
    echo 使用自定义路径: %ENV_PREFIX%
    conda env create -f earth_forecasting_env.yml --prefix "%ENV_PREFIX%"
    echo.
    echo 激活环境使用: conda activate %ENV_PREFIX%
) else (
    echo 使用默认 Conda 环境路径
    conda env create -f earth_forecasting_env.yml
    echo.
    echo 激活环境使用: conda activate %ENV_NAME%
)

echo.
echo 步骤 2: 验证环境创建...

if defined ENV_PREFIX (
    call conda activate "%ENV_PREFIX%"
) else (
    call conda activate %ENV_NAME%
)

echo.
echo Python 版本:
python --version

echo.
echo 已安装的关键包:
python -c "import torch; print(f'PyTorch: {torch.__version__}')"
python -c "import transformers; print(f'Transformers: {transformers.__version__}')"
python -c "import xarray; print(f'XArray: {xarray.__version__}')"

echo.
echo =========================================
echo 环境配置完成！
echo =========================================
pause

