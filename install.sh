#!/usr/bin/env bash
# 晴川知识库 · 一键安装脚本
# 用法: ./install.sh [--obsidian-path <vault路径>]
set -euo pipefail

SKILL_NAME="knowledge-base-habits"
OBSIDIAN_PATH=""

# 解析参数
while [[ $# -gt 0 ]]; do
  case "$1" in
    --obsidian-path)
      OBSIDIAN_PATH="$2"
      shift 2
      ;;
    --help|-h)
      echo "用法: ./install.sh [--obsidian-path <路径>]"
      echo ""
      echo "选项:"
      echo "  --obsidian-path <路径>  设置 Obsidian vault 路径（如 /mnt/d/obsidian/MyVault）"
      echo ""
      echo "安装后可在 SKILL.md 中手动修改路径，或重新运行脚本更新。"
      exit 0
      ;;
    *)
      echo "未知参数: $1"
      exit 1
      ;;
  esac
done

# 检测目标平台
INSTALL_DIR=""
if [ -d "$HOME/.openclaw/workspace/skills" ]; then
  INSTALL_DIR="$HOME/.openclaw/workspace/skills/$SKILL_NAME"
  echo "✓ 检测到 OpenClaw"
elif [ -d "$HOME/.claude/skills" ]; then
  INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"
  echo "✓ 检测到 Claude Code"
else
  # 默认 Claude Code
  INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  echo "→ 未检测到已有技能目录，默认安装到 Claude Code: $INSTALL_DIR"
fi

# 复制技能文件
echo "→ 安装到: $INSTALL_DIR"
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# 复制所有文件
cp "$(dirname "$0")/SKILL.md" "$INSTALL_DIR/"
cp -r "$(dirname "$0")/reference" "$INSTALL_DIR/"
cp "$(dirname "$0")/test-prompts.json" "$INSTALL_DIR/"

echo "✓ 技能文件已复制"

# 设置 Obsidian 路径
if [ -n "$OBSIDIAN_PATH" ]; then
  # 移除末尾斜杠
  OBSIDIAN_PATH="${OBSIDIAN_PATH%/}"
  if command -v sed &> /dev/null; then
    sed -i "s|<OBSIDIAN_VAULT>|$OBSIDIAN_PATH|g" "$INSTALL_DIR/SKILL.md"
    echo "✓ Obsidian 路径已设置为: $OBSIDIAN_PATH"
  fi
else
  echo "⚠ 未设置 Obsidian 路径。请手动编辑 $INSTALL_DIR/SKILL.md"
  echo "  将 <OBSIDIAN_VAULT> 替换为你的 Obsidian vault 路径"
fi

echo ""
echo "═══════════════════════════════════"
echo "  ✓ 晴川知识库技能安装完成！"
echo "═══════════════════════════════════"
echo ""
echo "  目录结构:"
echo "  $INSTALL_DIR/"
echo "  ├── SKILL.md"
echo "  ├── reference/"
echo "  │   ├── note-templates.md"
echo "  │   ├── moc-spec.md"
echo "  │   ├── experience-to-method.md"
echo "  │   ├── worldview-calibration.md"
echo "  │   ├── worldview-growth.md"
echo "  │   └── design-rationale.md"
echo "  └── test-prompts.json"
echo ""
echo "  触发词: 「记一下」「这个放哪」「帮我回顾」"
echo "  下一步: 修改 <OBSIDIAN_VAULT> 为你的实际路径（如未设置）"
