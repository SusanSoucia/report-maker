# 电视机工厂方法模式 — 软件架构与设计模式实验

> 本示例展示 `report-maker` skill 在「创建型模式」实验中的完整产出。
> 课程：软件架构与设计模式 | 学校：重庆大学大数据与软件学院

## 实验概述

以工厂方法模式（Factory Method）设计一个电视机工厂系统。每种品牌电视机对应一个子工厂，新增品牌只需新增一对具体产品+具体工厂，无需修改已有代码，体现开闭原则。

## 输入材料 (`input/`)

| 文件 | 说明 |
|------|------|
| `1.软件架构与设计模式实验（创建型模式）.docx` | 教师提供的实验报告模板（封面 + 评分表 + 四章节结构） |
| `个人要求.txt` | 实验任务要求：7 个类/接口、UML 类图、运行截图 |

## 产出物 (`output/`)

### 报告

- **`工厂方法模式实验报告.docx`** — 按模板格式填写的完整 Word 报告

### Java 源码（7 个文件）

```
src/
├── TV.java                 ← 抽象产品接口
├── HaierTV.java            ← 具体产品
├── HisenseTV.java          ← 具体产品
├── TVFactory.java          ← 抽象工厂接口
├── HaierTVFactory.java     ← 具体工厂
├── HisenseTVFactory.java   ← 具体工厂
└── Client.java             ← 客户端
```

### UML 图表（1 张）

| 图表 | 文件 |
|------|------|
| 工厂方法模式类图 | `class_diagram.puml` |

### 图片生成

```bash
cd output/image
bash generate.sh    # 一键生成 PNG
# 或直接：
plantuml -tpng class_diagram.puml -o image/
```

### 报告构建

```bash
cd output
python3 fill_report.py    # 基于模板生成报告
```

## 设计要点

- **四大角色**：Product（TV）→ ConcreteProduct（HaierTV / HisenseTV）→ Creator（TVFactory）→ ConcreteCreator
- **开闭原则**：新增 TCL 品牌只需新增 TCLTV + TCLTVFactory，零修改已有代码
- **依赖倒置**：Client 仅依赖 TVFactory 和 TV 两个抽象，不感知具体类
- **AI 辅助**：三.1 方法和三.2 步骤章节围绕 AI（Claude Code）辅助实验报告写作展开

## 报告章节结构

| 章节 | 内容侧重 |
|------|----------|
| 一、实验任务 | 工厂方法模式设计电视机工厂的任务描述 |
| 二、实验环境 | OS / JDK / VS Code / PlantUML / Claude Code |
| 三.1 方法 | AI 辅助实验报告写作的方法论（人机协同、产物可复现） |
| 三.2 步骤 | 需求确认 → 代码生成 → UML 建模 → 运行验证 → 报告生成 |
| 三.3 效果 | 运行结果分析 + 设计特性验证 + AI 辅助效果评述 |
| 四、实验步骤 | 8 步具体实验操作步骤 |

## 复现本示例

1. 安装 `report-maker` skill
2. 在 Claude Code 中提供 `input/` 下的模板和需求文档
3. Skill 按流程生成代码、UML 图和报告

> **注意**：每次运行结果会因模型版本和上下文不同而有差异，本示例展示的是一次实际运行的结果。
