# 团队协作指南

**污渍检测项目 - 大创团队**

---

## 👥 团队成员与分工

### A - 代码负责人（你）
- **职责**：
  - 负责项目代码开发和调试
  - 维护代码质量和规范
  - 协助其他成员解决技术问题
  - 管理 Git 仓库和版本控制

### B - 研究负责人
- **职责**：
  - 研究图像处理算法
  - 优化现有算法性能
  - 探索新的污渍检测方法
  - 撰写算法文档和研究报告

### C - 数据负责人
- **职责**：
  - 收集和整理图像数据
  - 标注数据（区分 clean 和 stain）
  - 数据质量控制
  - 创建数据集文档

---

## 🚀 快速开始（给 B 和 C）

### 第一步：获取代码

如果使用 Git：
```bash
# 克隆仓库
git clone <repository-url>
cd dachuang
```

如果使用共享文件夹：
- 复制整个 `dachuang` 文件夹到你的电脑

### 第二步：设置环境

**推荐使用 Conda（适合新手）**：

```bash
# 创建虚拟环境
conda env create -f environment.yml

# 激活环境
conda activate stain_detection
```

**或者使用 pip**：

```bash
# 创建虚拟环境
python -m venv venv

# 激活环境（Windows）
venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt
```

### 第三步：运行程序

```bash
# Windows 用户（最简单）
run.bat

# 或者手动运行
python data/generate_sample_images.py
python src/demo.py
```

---

## 📂 如何使用 demo.py

### 对于 B（研究负责人）

**查看和修改算法参数**：

打开 `src/demo.py`，你可以调整以下参数：

```python
# 二值化阈值（第 56 行附近）
binary_image = threshold_image(gray_image, threshold_value=127)
# 尝试修改 threshold_value 为其他值（0-255）

# 边缘检测阈值（第 59 行附近）
edges = edge_detection(gray_image, low_threshold=50, high_threshold=150)
# 尝试修改 low_threshold 和 high_threshold
```

**添加新的图像处理方法**：

你可以在 `demo.py` 中添加新的函数，例如：

```python
def gaussian_blur(gray_image, kernel_size=5):
    """
    高斯模糊处理
    """
    blurred = cv2.GaussianBlur(gray_image, (kernel_size, kernel_size), 0)
    return blurred
```

然后在 `process_single_image()` 函数中调用它。

### 对于 C（数据负责人）

**添加新的图像数据**：

1. 将你收集的图像放入 `data/` 文件夹
2. 命名规范：
   - 干净图像：`clean_XX.jpg`（例如：`clean_04.jpg`, `clean_05.jpg`）
   - 污渍图像：`stain_XX.jpg`（例如：`stain_04.jpg`, `stain_05.jpg`）
3. 运行 `python src/demo.py` 查看处理结果

**创建数据集文档**：

在 `data/` 文件夹中创建 `DATA_INFO.md`：

```markdown
# 数据集说明

## 图像来源
- 来源 1：...
- 来源 2：...

## 图像统计
- 总数：XX 张
- 干净图像：XX 张
- 污渍图像：XX 张

## 图像规格
- 分辨率：...
- 格式：JPG
- 大小：...

## 标注规则
...
```

---

## 🔄 版本控制（Git 工作流程）

### 初次设置

```bash
# 配置你的信息（只需要做一次）
git config user.name "你的名字"
git config user.email "你的邮箱"
```

### 日常工作流程

#### 1. 开始工作前 - 拉取最新代码

```bash
# 确保你在主分支
git checkout main

# 拉取最新代码
git pull
```

#### 2. 进行修改

- 修改代码或添加文件
- 定期保存你的工作

#### 3. 提交修改

```bash
# 查看修改了哪些文件
git status

# 添加修改的文件
git add .

# 提交修改（写清楚你做了什么）
git commit -m "添加了新的数据集" 
# 或
git commit -m "优化了边缘检测算法"
# 或
git commit -m "修复了图像加载的bug"

# 推送到远程仓库
git push
```

#### 4. 处理冲突

如果推送时提示冲突：

```bash
# 先拉取最新代码
git pull

# Git 会标记冲突的文件，手动解决冲突
# 打开文件，查找 <<<<<<< 和 >>>>>>> 标记
# 修改后保存

# 添加解决后的文件
git add .

# 提交合并
git commit -m "解决冲突"

# 推送
git push
```

---

## 💬 沟通与协作

### 定期会议

- **频率**：每周一次（建议）
- **内容**：
  - 汇报各自进度
  - 讨论遇到的问题
  - 规划下一步工作

### 使用的工具

- **代码共享**：GitHub / Gitee / 共享文件夹
- **即时通讯**：微信群 / QQ群
- **文档协作**：腾讯文档 / 石墨文档
- **任务管理**：Trello / Notion / Excel

### 提问模板

遇到问题时，按照这个模板提问会更容易得到帮助：

```
【问题描述】
简单描述你遇到的问题

【复现步骤】
1. 我做了什么操作
2. ...

【错误信息】
复制粘贴完整的错误信息

【我的环境】
- 操作系统：Windows 10 / macOS / Linux
- Python 版本：python --version
- 是否使用虚拟环境：是/否

【我尝试过的方法】
- 尝试 1：...
- 尝试 2：...
```

---

## 📋 开发规范

### 代码规范

1. **命名规范**：
   - 函数名：使用小写字母和下划线，如 `load_image()`
   - 变量名：使用小写字母和下划线，如 `gray_image`
   - 常量名：使用大写字母和下划线，如 `MAX_SIZE`

2. **注释规范**：
   - 每个函数都要有文档字符串（docstring）
   - 复杂的代码要添加行内注释
   - 注释使用中文，简洁明了

3. **代码格式**：
   - 缩进使用 4 个空格
   - 每行代码不超过 80 字符（尽量）
   - 函数之间空 2 行

### 文件组织

```
dachuang/
├── src/              # 所有 Python 代码
├── data/             # 所有图像数据
├── output/           # 所有输出结果（不要提交到 Git）
├── docs/             # 文档（可选）
└── tests/            # 测试代码（未来添加）
```

### 提交信息规范

好的提交信息示例：
- ✅ `添加高斯模糊功能`
- ✅ `修复图像加载路径错误`
- ✅ `更新 README 文档`
- ✅ `添加 20 张新的训练图像`

不好的提交信息示例：
- ❌ `update`
- ❌ `fix bug`
- ❌ `修改`

---

## 🆘 常见问题

### 1. 环境相关

**Q: 虚拟环境激活失败？**

A: 
- Windows: 确保使用 `venv\Scripts\activate`
- 如果提示权限错误，以管理员身份运行命令提示符

**Q: pip 安装很慢？**

A: 使用国内镜像：
```bash
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 2. 代码相关

**Q: 运行 demo.py 时找不到图像？**

A: 先运行 `python data/generate_sample_images.py` 生成示例数据

**Q: 如何添加新的图像处理功能？**

A: 
1. 在 `demo.py` 中添加新函数
2. 在 `process_single_image()` 中调用
3. 在 `display_images()` 或 `save_processing_steps()` 中显示结果

### 3. Git 相关

**Q: git push 提示权限错误？**

A: 
1. 确认你有仓库的写权限
2. 检查 Git 账号是否配置正确
3. 可能需要配置 SSH 密钥

**Q: 不小心提交了错误的文件怎么办？**

A: 
```bash
# 撤销最后一次提交（保留修改）
git reset HEAD~1

# 重新添加正确的文件
git add <正确的文件>
git commit -m "..."
```

---

## 📅 项目里程碑

### 第一阶段（当前）✅
- [x] 环境搭建完成
- [x] 基础 demo 代码完成
- [x] 示例数据准备完成

### 第二阶段（2周内）
- [ ] 收集 50+ 张真实图像数据
- [ ] 添加更多图像处理算法
- [ ] 实现特征提取功能

### 第三阶段（4周内）
- [ ] 实现机器学习分类
- [ ] 模型评估和优化
- [ ] 撰写项目报告

### 第四阶段（6周内）
- [ ] （可选）尝试深度学习方法
- [ ] 准备项目答辩
- [ ] 完善文档

---

## 📖 学习资源

### Python 基础
- [廖雪峰 Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)
- [菜鸟教程 - Python](https://www.runoob.com/python3/python3-tutorial.html)

### OpenCV
- [OpenCV 中文文档](https://opencv.apachecn.org/)
- [OpenCV Python 教程](https://www.bilibili.com/video/BV1PV411774y/)

### Git
- [Git 简明指南](https://rogerdudler.github.io/git-guide/index.zh.html)
- [GitHub 使用教程](https://www.bilibili.com/video/BV1yo4y1d7CM/)

### 机器学习
- [吴恩达机器学习课程](https://www.coursera.org/learn/machine-learning)
- [Scikit-learn 中文文档](https://sklearn.apachecn.org/)

---

## 📞 联系方式

如果遇到问题，可以通过以下方式联系：

- **A（代码负责人）**：[你的联系方式]
- **B（研究负责人）**：[B 的联系方式]
- **C（数据负责人）**：[C 的联系方式]

**微信群/QQ群**：[群号]

---

**祝大家协作愉快！一起加油！** 💪🎉

