#!/bin/bash
# Earth Forecasting Transformer - Conda 环境配置脚本
# 使用方法：bash setup_earth_forecasting_env.sh

echo "========================================="
echo "Earth Forecasting Transformer"
echo "Conda 环境配置脚本"
echo "========================================="

# 设置环境名称
ENV_NAME="earth_forecasting"

# 设置环境安装路径（可选，如果使用默认路径请注释掉）
# ENV_PREFIX="$HOME/conda_envs/earth_forecasting"

# 检查 conda 是否安装
if ! command -v conda &> /dev/null; then
    echo "错误: 未找到 conda 命令，请先安装 Anaconda 或 Miniconda"
    exit 1
fi

echo ""
echo "步骤 1: 创建 Conda 虚拟环境..."

# 如果设置了自定义路径，使用 --prefix，否则使用默认路径
if [ -n "$ENV_PREFIX" ]; then
    echo "使用自定义路径: $ENV_PREFIX"
    conda env create -f earth_forecasting_env.yml --prefix "$ENV_PREFIX"
    echo ""
    echo "激活环境使用: conda activate $ENV_PREFIX"
else
    echo "使用默认 Conda 环境路径"
    conda env create -f earth_forecasting_env.yml
    echo ""
    echo "激活环境使用: conda activate $ENV_NAME"
fi

echo ""
echo "步骤 2: 验证环境创建..."

if [ -n "$ENV_PREFIX" ]; then
    conda activate "$ENV_PREFIX"
else
    conda activate "$ENV_NAME"
fi

echo ""
echo "Python 版本:"
python --version

echo ""
echo "已安装的关键包:"
python -c "import torch; print(f'PyTorch: {torch.__version__}')"
python -c "import transformers; print(f'Transformers: {transformers.__version__}')"
python -c "import xarray; print(f'XArray: {xarray.__version__}')"

echo ""
echo "========================================="
echo "环境配置完成！"
echo "========================================="






