# 晴川知识库 · Knowledge Base Habits

> 认知操作系统：**经验 → 方法 → 自我 → 品牌**

一个基于 Obsidian 的三层知识管理框架，将碎片化的经验通过验证驱动的方式逐层升级为能力积累、自我理解和品牌输出。

## 核心理念

```
碎片(日记) → 工具(能力积累) → 人(自我理解) → 品牌(对外输出)
```

每一层的升级不是靠感觉，而是靠**验证次数**（≥3次）。这不是一个分类系统，而是一条认知输出成熟度的生长路径——**内→外→回流的闭环**。

## 🚀 一键安装

```bash
git clone https://github.com/chenyitao123/knowledge-base-habits.git
cd knowledge-base-habits
./install.sh --obsidian-path /你的/Obsidian/Vault/路径
```

或手动安装：
```bash
cp -r knowledge-base-habits ~/.claude/skills/
# 然后编辑 SKILL.md，将 <OBSIDIAN_VAULT> 替换为实际路径
```

## 目录结构

```
skills/knowledge-base-habits/
├── SKILL.md                        # 主规范文件（每次对话加载）
├── reference/
│   ├── note-templates.md           # 三层笔记模板
│   ├── moc-spec.md                 # MOC（认知地图）规范
│   ├── experience-to-method.md     # 经验→能力五步流程
│   ├── worldview-calibration.md    # 世界观校准回路
│   ├── worldview-growth.md         # 世界观生长机制
│   └── design-rationale.md         # 底层设计理念
├── test-prompts.json               # 测试用例
└── install.sh                      # 一键安装脚本
```

## 三层框架

| 层 | 回答的问题 | 升级条件 |
|----|-----------|---------|
| **日记** | 今天发生了什么 | — |
| **工具/** | 「别人能照着做吗？」/「能解释≥3件事吗？」 | 同一操作 ≥3 次 |
| **人/** | 「5年后还重要吗？」 | 能力积累改变自我理解 |
| **品牌/** | 「外界通过什么认识我？」 | 自我理解驱动表达冲动 |

## 四种 AI 角色

| 角色 | 触发条件 | 职责 |
|------|---------|------|
| **记录者** | 自动/「记一下」 | 日记双写 + Tasks |
| **整理者** | 「这个放哪」 | 内容落位 + frontmatter + 连接 |
| **诊断者** | 「帮我看看方向」 | 方向锚定 vs 行动对比 |
| **提炼者** | 周日回顾 | 碎片升级为能力 / 驱动品牌输出 |

## 核心特性

- **矛盾字段（contradicts）**：每条人层笔记必须标注与之矛盾的其他笔记，不回避认知张力
- **MOC 三级体系**：层 MOC（阅读路径）→ 专项 MOC（单命题地图）→ 子目录索引（内容列表）
- **世界观校准回路**：对比「说了什么」和「做了什么」，呈现偏离
- **世界观生长机制**：三种模式（注入/连接/升级）处理方向锚本身的进化
- **资源入库规则**：资源跟笔记走同一套三层框架，歧义检测防错放
- **主线校准（硬前置）**：任何结构操作前必读 MEMORY.md 方向锚定

## 适用场景

- 使用 Obsidian 进行个人知识管理
- 需要将碎片经验系统化为方法论
- 需要 AI 助手理解知识库结构和偏好
- 追求「用经验验证认知，用品牌验证自我」

## 设计理念

详见 [reference/design-rationale.md](reference/design-rationale.md)

---

> 晴川不做裁判只做镜子——在偏离时呈现事实，让你自己判断。
