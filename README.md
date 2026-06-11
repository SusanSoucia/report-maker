# report-maker

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> 面向本科计算机软件类课程的实验报告写作 Claude Code Skill。
> 覆盖软件架构、设计模式、系统设计等课程。协助理解需求文档、撰写设计思路与架构分析、生成 UML 等图表，最终按 Word 模板输出完整报告。

## 快速开始

### 前置条件

- [Claude Code](https://claude.ai/code) CLI
- Python 3.10+（用于生成 PNG 图片和构建 .docx）
- 可选：本地 PlantUML（如无，skill 会使用在线服务器）

### 安装

```bash
# 克隆本仓库到 Claude Code skills 目录
git clone https://github.com/YOUR_USERNAME/report-maker.git ~/.claude/skills/report-maker
```

安装后，在 Claude Code 中提及"写实验报告""软件架构实验""设计模式实验"等关键词即可自动触发。

### 使用流程

1. 准备好**实验模板**（.docx）和**实验要求文档**
2. 在 Claude Code 中说"我要写实验报告"
3. 按提示提供模板和要求文档
4. Skill 会引导你完成：需求理解 → 架构设计 → 图表生成 → 报告撰写 → 自检

## 目录结构

```
report-maker/
├── SKILL.md                     # Skill 定义文件
├── references/
│   └── plantuml_guide.md        # PlantUML 语法速查
└── examples/
    └── atm-system/              # 使用例：ATM 系统设计模式实验
        ├── README.md            # 使用例说明
        ├── input/               # 输入材料
        │   ├── template.docx    # 教师提供的实验模板
        │   ├── requirements.docx # 详细需求文档
        │   └── personal-notes.txt
        └── output/              # 产出物
            ├── 实验报告.docx    # 最终 Word 报告
            ├── 实验报告.md      # Markdown 版本
            ├── build_docx.py    # docx 构建脚本
            └── image/           # 图表
                ├── *.puml       # PlantUML 源码（10 张）
                ├── generate.sh  # 一键生成 PNG
                └── png/*.png    # 生成的图片
```

## 核心特点

- **模板为王**：不预设报告结构，以用户提供的 Word 模板为最高规范
- **需求驱动设计**：每个设计决策必须绑定需求依据
- **图表可复现**：所有 UML 图保留 PlantUML 源码和生成脚本
- **五层自检**：L1 硬性规则 → L5 运行时纠错，确保输出质量
- **主动确认**：需求不完整时提出澄清问题，不自编内容

## License

MIT
