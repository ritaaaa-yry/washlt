# Earth Forecasting Transformer - Conda 环境配置指南

本指南介绍如何为 Earth Forecasting Transformer 项目配置 Conda 虚拟环境。

## 📋 目录

- [快速开始](#快速开始)
- [方法一：使用默认路径（推荐）](#方法一使用默认路径推荐)
- [方法二：使用自定义路径](#方法二使用自定义路径)
- [手动配置 Conda 环境目录](#手动配置-conda-环境目录)
- [验证安装](#验证安装)
- [常见问题](#常见问题)

---

## 🚀 快速开始

### Windows 用户

**最简单的方法：双击运行 `setup_earth_forecasting_env.bat`**

或者在 PowerShell/CMD 中执行：
```bash
setup_earth_forecasting_env.bat
```

### Linux/Mac 用户

```bash
chmod +x setup_earth_forecasting_env.sh
bash setup_earth_forecasting_env.sh
```

---

## 方法一：使用默认路径（推荐）

默认情况下，Conda 会将环境安装在：
- **Windows**: `C:\Users\<用户名>\anaconda3\envs\earth_forecasting` 或 `C:\Users\<用户名>\miniconda3\envs\earth_forecasting`
- **Linux/Mac**: `~/anaconda3/envs/earth_forecasting` 或 `~/miniconda3/envs/earth_forecasting`

### 步骤

1. **创建环境**
   ```bash
   conda env create -f earth_forecasting_env.yml
   ```

2. **激活环境**
   ```bash
   conda activate earth_forecasting
   ```

3. **验证安装**
   ```bash
   python --version
   python -c "import torch; print(torch.__version__)"
   ```

---

## 方法二：使用自定义路径

如果您想将环境安装到特定目录（例如：`/home/user/conda_envs/earth_forecasting` 或 `C:\conda_envs\earth_forecasting`）：

### 步骤

1. **创建环境到指定路径**
   
   **Linux/Mac:**
   ```bash
   conda env create -f earth_forecasting_env.yml --prefix ~/conda_envs/earth_forecasting
   ```
   
   **Windows:**
   ```bash
   conda env create -f earth_forecasting_env.yml --prefix C:\conda_envs\earth_forecasting
   ```

2. **激活环境**
   
   **Linux/Mac:**
   ```bash
   conda activate ~/conda_envs/earth_forecasting
   ```
   
   **Windows:**
   ```bash
   conda activate C:\conda_envs\earth_forecasting
   ```

---

## 手动配置 Conda 环境目录

如果您希望设置默认的自定义环境目录：

### 1. 查看当前环境目录

```bash
conda config --show envs_dirs
```

### 2. 添加新的环境目录

**Linux/Mac:**
```bash
conda config --add envs_dirs ~/conda_envs
```

**Windows:**
```bash
conda config --add envs_dirs C:\conda_envs
```

### 3. 验证配置

```bash
conda config --show envs_dirs
```

现在创建环境时会优先使用新添加的目录。

---

## ✅ 验证安装

激活环境后，运行以下命令验证关键包是否安装成功：

```bash
# 检查 Python 版本
python --version

# 检查 PyTorch
python -c "import torch; print(f'PyTorch: {torch.__version__}')"
python -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}')"

# 检查 Transformers
python -c "import transformers; print(f'Transformers: {transformers.__version__}')"

# 检查 XArray（地球科学数据处理）
python -c "import xarray; print(f'XArray: {xarray.__version__}')"

# 检查其他关键包
python -c "import numpy, pandas, matplotlib; print('基础库安装成功')"
```

---

## 🔧 常见问题

### Q1: 环境创建失败，提示通道错误

**解决方法：**
```bash
# 更新 conda
conda update conda

# 清除 conda 缓存
conda clean --all
```

### Q2: PyTorch CUDA 版本不匹配

**解决方法：**

编辑 `earth_forecasting_env.yml`，修改 PyTorch CUDA 版本：
```yaml
- pytorch-cuda=11.8  # 改为您系统支持的 CUDA 版本（如 11.7, 12.1 等）
```

或者使用 CPU 版本（删除 `pytorch-cuda` 行，添加 `- cpuonly`）

### Q3: 安装速度慢

**解决方法：**
```bash
# 使用国内镜像源（清华大学）
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
```

### Q4: 找不到 conda 命令

**解决方法：**
- Windows: 安装 Anaconda 或 Miniconda，并确保在安装时勾选 "Add to PATH"
- Linux/Mac: 安装后需要初始化 shell
  ```bash
  conda init bash  # 或 zsh
  ```

### Q5: 环境激活后仍然使用系统 Python

**解决方法：**
```bash
# 检查当前 Python 路径
which python  # Linux/Mac
where python  # Windows

# 应该指向 conda 环境中的 Python
# 如果不对，重新激活环境
conda deactivate
conda activate earth_forecasting
```

---

## 📝 环境文件说明

### `earth_forecasting_env.yml`

包含所有依赖包的完整配置文件：
- **Python 3.10**: 基础解释器
- **PyTorch**: 深度学习框架（支持 CUDA 11.8）
- **Transformers**: Transformer 模型库
- **XArray/NetCDF4**: 地球科学数据格式支持
- **Jupyter**: 交互式开发环境
- 以及其他科学计算和可视化工具

---

## 🔄 更新环境

如果 `earth_forecasting_env.yml` 文件更新了，运行：

```bash
conda env update -f earth_forecasting_env.yml --prune
```

`--prune` 选项会删除环境中不再需要的包。

---

## 🗑️ 删除环境

如果不再需要此环境：

```bash
conda env remove -n earth_forecasting
# 或使用路径
conda env remove --prefix ~/conda_envs/earth_forecasting
```

---

## 📚 更多资源

- [Conda 官方文档](https://docs.conda.io/)
- [Conda 环境管理指南](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

---

**祝您使用愉快！** 🎉






