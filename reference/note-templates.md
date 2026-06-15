# 笔记模板参考

> 需要时加载：`read skills/knowledge-base-habits/reference/note-templates.md`

## 工具/ 层笔记模板

```yaml
area: 工具
main_line:
  purpose: ""       # 对破解意义消散有什么用？
  path: ""          # 领域路径
status: seedling    # seedling → budding → evergreen
verified_count: 0   # 已验证次数，≥3 后升级
depth: method       # method（可操作的方法）| insight（超越单个工具的认知模式）
feeds_into: []
connects_with: []
```

**判断标准**：
- `depth: method` —「如果另一个同学遇到同样的问题，这篇笔记能让他照着做吗？」→ 能 → 进
- `depth: insight` —「这个认知能解释至少 3 件已经发生的事吗？」→ 能 → 进

> 不再强制区分「器」和「不器」。同一篇笔记可以从 method 开始，验证次数多了自然升为 insight。分类成本降低，把认知能量留给产出。

## 人/ 层笔记模板

```yaml
area: 人
main_line:
  purpose: ""
  path: ""
status: evergreen
last_calibrated: ""  # 上次校准日期
triggered_by: []     # 哪些工具/层积累触发了这次自我理解
contradicts: []      # 与之矛盾的其他笔记（必须标注）
feeds_into: []       # 驱动了哪些品牌/层输出
connects_with: []
```

**判断标准**：「这个问题在 5 年后还会重要吗？」→ 会 → 进

`contradicts` 字段强制要求：每条人/层笔记必须标注与之矛盾的其他笔记。善于多角度思考的人能同时看到事物两面 → 不回避矛盾。

## 品牌/ 层笔记模板

```yaml
area: 品牌
subtype: article     # article | product | research | career
status: draft        # draft → published → iterating
source: []           # 来自哪些工具/层和人/层的积累
audience: ""         # 写给谁看
published_at: ""     # 发布日期
feedback: ""         # 外界反馈摘要
connects_with: []
```

**判断标准**：「这是我对外的输出吗？外界通过这个认识我吗？」→ 是 → 进

品牌/层不是「写好了就放那」——每次迭代或收到反馈都应更新 `feedback` 和 `status`。

## 日记模板

```yaml
---
date: YYYY-MM-DD
tags: [日记, 主题1, 主题2]
---

# YYYY-MM-DD
```

`tags` 必须包含 `日记`，其余 2-5 个关键词概括当日主题。
