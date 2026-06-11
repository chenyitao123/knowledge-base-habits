# 笔记模板参考

> 需要时加载：`read skills/knowledge-base-habits/reference/note-templates.md`

## 器/ 层笔记模板

```yaml
area: 器
main_line:
  purpose: ""       # 对破解意义消散有什么用？
  path: ""          # 按你的领域划分
status: seedling    # seedling → budding → evergreen
verified_count: 0   # 已验证次数，≥3 后升级
feeds_into: []
connects_with: []
```

**判断标准**：「如果另一个同学遇到同样的问题，这篇笔记能让他照着做吗？」→ 能 → 进

## 不器/ 层笔记模板

```yaml
area: 不器
main_line:
  purpose: ""
  path: ""
status: budding     # 洞察至少连 3 篇笔记才标 budding
evidence: []        # 支撑这个洞察的具体日记/笔记
contradicts: []     # 与之矛盾的其他笔记（必须标注）
feeds_into: []
connects_with: []
```

**判断标准**：「这个洞察能解释至少 3 件已经发生的事吗？」→ 能 → 进

`contradicts` 字段强制要求：每条不器层洞察必须标注与之矛盾的其他笔记。

## 所以为人/ 层笔记模板

```yaml
area: 所以为人
status: evergreen
last_calibrated: "" # 上次校准日期
triggered_by: []    # 哪几篇不器层洞察触发了这次方向校准
```

**判断标准**：「这个问题在 5 年后还会重要吗？」→ 会 → 进

## 日记模板

```yaml
---
date: YYYY-MM-DD
tags: [日记, 主题1, 主题2]
---

# YYYY-MM-DD
```

`tags` 必须包含 `日记`，其余 2-5 个关键词概括当日主题。
