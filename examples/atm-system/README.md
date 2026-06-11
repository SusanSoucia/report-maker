# ATM 自动存取款机系统 — 软件架构与设计模式实验

> 本示例展示 `report-maker` skill 在真实实验场景中的完整产出。
> 课程：软件架构与设计模式 | 学校：重庆大学大数据与软件学院

## 实验概述

基于 ATM 自动存取款机系统的需求文档，完成系统架构设计和设计模式分析。采用 4+1 视图模型进行多维度架构描述，并识别及应用了 7 种设计模式。

## 输入材料 (`input/`)

| 文件 | 说明 |
|------|------|
| `template.docx` | 教师提供的实验报告模板（封面 + 评分表 + 章节结构） |
| `requirements.docx` | ATM 系统的详细需求文档（GB/T8567-2006 格式） |
| `personal-notes.txt` | 个人补充要求（篇幅控制、重点取舍） |

## 产出物 (`output/`)

### 报告

- **`实验报告.docx`** — 按模板格式填写的完整 Word 报告（133 段，21 张表格）
- **`实验报告.md`** — 同内容 Markdown 版本，方便在线预览

### 架构设计亮点

- **4+1 视图覆盖**：场景视图（用例图 + 活动图）→ 逻辑视图（类图 + 包图）→ 进程视图（时序图）→ 开发视图（包图）→ 物理视图（部署图）
- **7 种设计模式**：State（ATM 会话状态机）、Strategy（交易类型多态）、Template Method（交易执行骨架）、Singleton（硬件控制器）、Proxy（银行系统代理）、Observer（硬件故障通知）、Facade（网络模块统一接口）
- **并发控制方案**：乐观锁（Account.version）+ 三阶段交易模型（预授权 → 执行 → 确认/取消）+ 幂等键
- **需求追溯矩阵**：24 项功能需求 + 6 项非功能需求，逐项映射到设计模块

### UML 图表（10 张）

| 图表 | 文件 | 视图 |
|------|------|------|
| 用例图 | `usecase.puml` | 场景 |
| 取款时序图 | `sequence_withdraw.puml` | 进程 |
| 转账时序图 | `sequence_transfer.puml` | 进程 |
| 系统活动图 | `activity_system.puml` | 场景 |
| 异常处理活动图 | `activity_exception.puml` | 场景 |
| 类图 | `class_diagram.puml` | 逻辑 |
| 包图 | `package_diagram.puml` | 逻辑/开发 |
| 进程视图 | `process_view.puml` | 进程 |
| 部署图 | `deployment.puml` | 物理 |
| ER 图 | `er_diagram.puml` | 数据 |

### 图片生成

```bash
cd output/image
bash generate.sh    # 一键生成所有 PNG
```

`generate.sh` 使用 PlantUML 在线服务器（deflate + base64 编码），无需本地安装 PlantUML。网络不可用时自动回退到 kroki.io。

## 复现本示例

1. 安装 `report-maker` skill
2. 在 Claude Code 中说"我要写 ATM 系统的实验报告"
3. 提供 `input/` 目录下的模板和需求文档
4. Skill 会按相同流程生成报告

> **注意**：每次运行结果会因模型版本和上下文不同而有差异，本示例展示的是一次实际运行的结果。
