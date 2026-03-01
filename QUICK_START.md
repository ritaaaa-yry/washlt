# 快速入门指南 ⚡

**5 分钟快速上手污渍检测项目**

---

## 📥 第一步：获取项目

### 方法 A：从 Git 克隆
```bash
git clone <repository-url>
cd dachuang
```

### 方法 B：下载压缩包
1. 下载项目压缩包
2. 解压到你的工作目录
3. 打开命令行，进入项目文件夹

---

## 🔧 第二步：安装依赖

### Windows 用户（推荐使用 Anaconda）

```bash
# 1. 创建虚拟环境
conda env create -f environment.yml

# 2. 激活环境
conda activate stain_detection

# 完成！
```

### 如果没有 Anaconda

```bash
# 1. 创建虚拟环境
python -m venv venv

# 2. 激活虚拟环境
venv\Scripts\activate

# 3. 安装依赖
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### Linux/Mac 用户

```bash
# 1. 创建虚拟环境
python3 -m venv venv

# 2. 激活虚拟环境
source venv/bin/activate

# 3. 安装依赖
pip install -r requirements.txt
```

---

## 🚀 第三步：运行程序

### 最简单的方法（Windows）

**双击 `run.bat` 文件**，就这么简单！

### 或者使用命令行

```bash
# 1. 生成示例图像（首次运行）
python data/generate_sample_images.py

# 2. 运行图像处理程序
python src/demo.py
```

---

## 📊 查看结果

程序运行后：

1. **窗口显示**：会弹出窗口显示处理结果（按任意键关闭）
2. **文件保存**：检查 `output/` 文件夹
   - `*_processing_steps.png`：完整的处理步骤
   - `*_gray.jpg`：灰度图
   - `*_binary.jpg`：二值化图
   - `*_edges.jpg`：边缘检测图

---

## 🎯 下一步做什么？

### 如果你是代码负责人（A）
👉 阅读 `src/demo.py`，理解代码结构  
👉 尝试修改参数，观察效果  
👉 查看 [COLLABORATION.md](COLLABORATION.md) 了解团队协作

### 如果你是研究负责人（B）
👉 运行程序，观察处理效果  
👉 尝试调整算法参数：
```python
# 在 demo.py 中修改这些值
threshold_value=127      # 二值化阈值
low_threshold=50        # 边缘检测低阈值
high_threshold=150      # 边缘检测高阈值
```
👉 思考如何改进算法

### 如果你是数据负责人（C）
👉 将你的图像放入 `data/` 文件夹  
👉 确保文件名包含 `clean` 或 `stain`  
👉 运行 `python src/demo.py` 查看效果

---

## ❓ 遇到问题？

### 问题 1: 找不到 Python
```bash
# 下载安装 Python 3.8+
https://www.python.org/downloads/

# 安装时记得勾选 "Add Python to PATH"
```

### 问题 2: pip 安装很慢
```bash
# 使用国内镜像
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 问题 3: 虚拟环境激活失败（Windows）
```bash
# 以管理员身份运行 PowerShell，执行：
Set-ExecutionPolicy RemoteSigned

# 然后重新激活
venv\Scripts\activate
```

### 问题 4: 找不到图像文件
```bash
# 运行示例图像生成脚本
python data/generate_sample_images.py
```

### 更多问题？
查看 [README.md](README.md) 或 [COLLABORATION.md](COLLABORATION.md)

---

## 📚 推荐学习路径

### 第 1 天
- ✅ 完成环境搭建
- ✅ 运行示例程序
- ✅ 理解项目结构

### 第 2-3 天
- 📖 阅读 `demo.py` 代码
- 📖 学习 OpenCV 基础
- 🔧 尝试修改参数

### 第 4-5 天
- 📊 添加自己的图像数据
- 🔧 尝试添加新功能
- 📝 记录实验结果

### 第 2 周
- 🚀 实现新的图像处理算法
- 📊 收集更多数据
- 👥 团队讨论和分享

---

## 🎉 恭喜！

你已经完成了快速入门！现在可以：

- 🔍 探索代码
- 🧪 进行实验
- 💬 与团队讨论

**祝你学习愉快！** 🚀

---

**有问题随时联系团队成员！**

