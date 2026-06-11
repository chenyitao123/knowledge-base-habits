# 晴川知识库 · 人机协作技能

> 一个 AI 辅助个人知识管理的 Claude Code / OpenClaw Skill，基于 **碎片 → 方法论 → 洞察 → 世界观** 四层认知生长模型。

## 这是什么？

knowledge-base-habits 是一个 Claude Code Skill，让 AI 成为你的知识管理伙伴——不只是帮你记录笔记，而是按照认知成熟度帮你**判断内容应该放在哪一层**、**何时该提炼经验为方法论**、**何时该追问世界观是否发生变化**。

核心模型：

```
碎片(日记) → 器(方法论) → 不器(洞察) → 所以为人(世界观)
```

升级不靠感觉，靠**验证次数**（≥3 次）。每一层都有严格的判断标准。

## 快速安装

```bash
# 一键安装到 Claude Code
curl -fsSL https://raw.githubusercontent.com/chenyitao123/knowledge-base-habits/main/install.sh | bash
```

或手动安装：

```bash
git clone https://github.com/chenyitao123/knowledge-base-habits.git
cd knowledge-base-habits
bash install.sh
```

安装脚本会引导你完成配置（Obsidian 路径、称呼偏好等）。

## 使用方式

安装后，用以下触发词激活晴川：

| 你说 | 晴川做什么 |
|------|-----------|
| 「记一下」/「帮我记录一下」 | 日记双写 + Tasks 追加 |
| 「这个放哪」 | 判断内容落位 + 写 frontmatter + 建立连接 |
| 「帮我看看方向」 | 对比方向锚定 vs 行动，诊断偏离 |
| 「帮我回顾」/周日 | 检查升级条件，提炼碎片为方法论/洞察 |
| 「晴川专栏写一篇」 | 世界观层输出长文 |

对话中发生方向决策、关键资源更新、重大转折时，晴川**自动触发**记录，无需手动说「记一下」。

## 四层知识结构

| 层 | 判断标准 | 反例 |
|----|---------|------|
| **日记** | 今天发生的事 | 不进：可复用的方法/成形洞察 |
| **器/** | 「别人能照着做吗？」≥3 次验证 | 不进：一次性经验 |
| **不器/** | 「能解释 ≥3 件已发生的事吗？」 | 不进：孤立感想 |
| **所以为人/** | 「5 年后还重要吗？」 | 不进：具体方法论 |

## 项目结构

```
skills/knowledge-base-habits/
├── SKILL.md                 # 主技能文件（每次对话加载）
├── reference/
│   ├── note-templates.md    # 各层笔记模板
│   ├── moc-spec.md          # MOC（认知地图）规范
│   ├── experience-to-method.md  # 经验→方法论升级流程
│   ├── worldview-calibration.md # 世界观校准回路
│   ├── worldview-growth.md      # 世界观生长机制
│   └── design-rationale.md      # 底层设计理念
└── test-prompts.json        # 测试用例
```

## 设计理念

这不是一个文件分类系统。每一层对应的是**认知的成熟度**，升级节点是验证次数而非感觉。知识管理的本质不是把东西放进正确的文件夹，是用经验验证认知。

更多细节见 [reference/design-rationale.md](reference/design-rationale.md)。

## 自定义

安装后可以修改以下内容来适配你的知识库：

- `SKILL.md` 中的知识库路径
- AI 对你的称呼（默认「兄弟」）
- 各层目录名称
- 自动触发规则

## 许可

MIT License
