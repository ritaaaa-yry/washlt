# 项目结构说明

**污渍检测项目 - 文件组织**

---

## 📂 完整项目结构

```
dachuang/
│
├── 📄 README.md                    # 项目主文档（必读）
├── 📄 QUICK_START.md              # 快速入门指南（新手必读）
├── 📄 COLLABORATION.md            # 团队协作指南
├── 📄 PROJECT_STRUCTURE.md        # 本文件：项目结构说明
│
├── 📄 requirements.txt            # Python 依赖包列表（pip 使用）
├── 📄 environment.yml             # Conda 环境配置文件
├── 📄 run.bat                     # Windows 快速启动脚本
├── 📄 .gitignore                  # Git 忽略文件配置
│
├── 📁 src/                        # 源代码目录
│   └── 📄 demo.py                 # 主程序：图像处理演示
│
├── 📁 data/                       # 数据目录
│   ├── 📄 generate_sample_images.py   # 示例图像生成脚本
│   ├── 🖼️ clean_01.jpg           # 干净图像样本 1
│   ├── 🖼️ clean_02.jpg           # 干净图像样本 2
│   ├── 🖼️ clean_03.jpg           # 干净图像样本 3
│   ├── 🖼️ stain_01.jpg           # 污渍图像样本 1
│   ├── 🖼️ stain_02.jpg           # 污渍图像样本 2
│   └── 🖼️ stain_03.jpg           # 污渍图像样本 3
│
└── 📁 output/                     # 输出目录（程序运行后生成）
    ├── 🖼️ *_processing_steps.png  # 处理步骤可视化
    ├── 🖼️ *_gray.jpg              # 灰度图
    ├── 🖼️ *_binary.jpg            # 二值化图
    └── 🖼️ *_edges.jpg             # 边缘检测图
```

---

## 📄 文件详细说明

### 根目录文件

| 文件名 | 用途 | 修改频率 | 重要性 |
|-------|------|---------|--------|
| `README.md` | 项目主文档，包含环境搭建和使用说明 | 低 | ⭐⭐⭐⭐⭐ |
| `QUICK_START.md` | 5分钟快速入门指南 | 低 | ⭐⭐⭐⭐ |
| `COLLABORATION.md` | 团队协作指南和开发规范 | 低 | ⭐⭐⭐⭐ |
| `PROJECT_STRUCTURE.md` | 项目结构说明（本文件） | 低 | ⭐⭐⭐ |
| `requirements.txt` | Python 依赖包列表 | 中 | ⭐⭐⭐⭐⭐ |
| `environment.yml` | Conda 虚拟环境配置 | 低 | ⭐⭐⭐⭐ |
| `run.bat` | Windows 快速启动脚本 | 低 | ⭐⭐⭐ |
| `.gitignore` | Git 版本控制忽略规则 | 低 | ⭐⭐⭐ |

### src/ 目录（源代码）

| 文件名 | 功能 | 代码行数 | 修改频率 |
|-------|------|---------|---------|
| `demo.py` | 主程序：图像处理演示 | ~300 行 | 高 |

**demo.py 包含的功能**：
- ✅ 图像加载（`load_image`）
- ✅ 灰度化处理（`convert_to_grayscale`）
- ✅ 二值化处理（`threshold_image`）
- ✅ 边缘检测（`edge_detection`）
- ✅ 图像显示（`display_images`）
- ✅ 图像保存（`save_image`）
- ✅ 批量处理（`main`）

### data/ 目录（数据）

| 类型 | 文件 | 数量 | 说明 |
|-----|------|-----|------|
| 脚本 | `generate_sample_images.py` | 1 | 生成示例图像 |
| 干净图像 | `clean_*.jpg` | 3 | 无污渍的图像 |
| 污渍图像 | `stain_*.jpg` | 3 | 有污渍的图像 |

**添加新图像的规则**：
- 文件格式：`.jpg`
- 命名规范：
  - 干净图像：`clean_XX.jpg`
  - 污渍图像：`stain_XX.jpg`
- 建议尺寸：400x400 像素或更大

### output/ 目录（输出）

程序运行后自动生成，包含：

| 类型 | 文件模式 | 说明 |
|-----|---------|------|
| 处理步骤 | `*_processing_steps.png` | 包含原图、灰度、二值化、边缘检测的合成图 |
| 灰度图 | `*_gray.jpg` | 灰度化处理结果 |
| 二值化图 | `*_binary.jpg` | 二值化处理结果 |
| 边缘图 | `*_edges.jpg` | 边缘检测处理结果 |

⚠️ **注意**：`output/` 目录的内容不应提交到 Git（已在 `.gitignore` 中配置）

---

## 🔄 工作流程

### 首次运行

```
1. 安装依赖
   pip install -r requirements.txt
   ↓
2. 生成示例数据
   python data/generate_sample_images.py
   ↓
3. 运行主程序
   python src/demo.py
   ↓
4. 查看结果
   检查 output/ 文件夹
```

### 日常使用

```
1. 添加新图像
   将图像放入 data/
   ↓
2. 运行程序
   python src/demo.py
   ↓
3. 查看结果
   检查 output/ 文件夹
```

### 开发新功能

```
1. 拉取最新代码
   git pull
   ↓
2. 修改 demo.py
   添加新函数或修改参数
   ↓
3. 测试
   python src/demo.py
   ↓
4. 提交代码
   git add .
   git commit -m "..."
   git push
```

---

## 📊 项目统计

### 代码量
- Python 文件：2 个
- 总代码行数：~400 行
- 注释覆盖率：>50%

### 文档
- Markdown 文档：5 个
- 配置文件：3 个
- 总文档页数：~15 页

### 依赖包
- 核心依赖：5 个（numpy, opencv-python, matplotlib, Pillow, scikit-learn）
- 可选依赖：2 个（torch, tensorflow）

---

## 🎯 各角色重点关注文件

### A - 代码负责人
**主要文件**：
- ⭐⭐⭐⭐⭐ `src/demo.py`
- ⭐⭐⭐⭐ `requirements.txt`
- ⭐⭐⭐⭐ `environment.yml`
- ⭐⭐⭐ `.gitignore`

**工作重点**：
- 开发和维护 `demo.py`
- 管理项目依赖
- 版本控制和代码审查

### B - 研究负责人
**主要文件**：
- ⭐⭐⭐⭐⭐ `src/demo.py`（算法部分）
- ⭐⭐⭐ `data/` 目录（测试数据）
- ⭐⭐⭐ `output/` 目录（结果分析）

**工作重点**：
- 研究和优化算法
- 调整参数
- 分析处理结果

### C - 数据负责人
**主要文件**：
- ⭐⭐⭐⭐⭐ `data/` 目录
- ⭐⭐⭐ `data/generate_sample_images.py`
- ⭐⭐⭐ `output/` 目录

**工作重点**：
- 收集和整理图像数据
- 数据质量控制
- 创建数据集文档

---

## 🔮 未来扩展

### 计划添加的文件/目录

```
dachuang/
├── 📁 docs/                      # 详细文档
│   ├── 算法说明.md
│   ├── 数据集说明.md
│   └── 实验报告.md
│
├── 📁 notebooks/                 # Jupyter notebooks（实验）
│   ├── 01_数据探索.ipynb
│   └── 02_算法测试.ipynb
│
├── 📁 models/                    # 保存训练好的模型
│   ├── logistic_model.pkl
│   └── cnn_model.pt
│
├── 📁 tests/                     # 单元测试
│   └── test_demo.py
│
└── 📁 utils/                     # 工具函数
    ├── preprocessing.py
    └── visualization.py
```

---

## 📝 维护清单

### 每周检查
- [ ] 更新 Git 仓库
- [ ] 检查依赖包版本
- [ ] 清理 `output/` 目录

### 每月检查
- [ ] 审查代码质量
- [ ] 更新文档
- [ ] 备份重要数据

### 添加新功能时
- [ ] 更新 `demo.py`
- [ ] 更新 `README.md`
- [ ] 添加代码注释
- [ ] 提交 Git

---

## ❓ 常见问题

### Q: 为什么没有 tests/ 目录？
A: 这是基础版本，未来会添加单元测试。

### Q: 为什么 output/ 是空的？
A: `output/` 目录在运行程序后自动生成内容。

### Q: 可以删除 .gitignore 吗？
A: 不建议删除，它确保不会提交不必要的文件到 Git。

### Q: requirements.txt 和 environment.yml 的区别？
A: 
- `requirements.txt`：用于 pip（适合 venv）
- `environment.yml`：用于 Conda（推荐新手使用）

---

**项目结构清晰，易于维护！** ✨

