#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# 晴川知识库 · 一键安装脚本
# knowledge-base-habits skill installer for Claude Code
# ============================================================

SKILL_NAME="knowledge-base-habits"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=============================================="
echo "  晴川知识库 · Knowledge Base Habits"
echo "  Claude Code Skill 安装器"
echo "=============================================="
echo ""

# --- Step 1: 检测目标目录 ---
if [ -d "${HOME}/.claude" ]; then
  CLAUDE_CONFIG_DIR="${HOME}/.claude"
else
  echo "⚠ 未检测到 ~/.claude/ 目录。"
  echo "  如果你还没安装 Claude Code，请先安装：https://claude.ai/code"
  echo "  然后重新运行此脚本。"
  echo ""
  read -rp "或者手动指定 Claude Code 配置目录: " CUSTOM_DIR
  CLAUDE_CONFIG_DIR="${CUSTOM_DIR}"
fi

TARGET_DIR="${CLAUDE_CONFIG_DIR}/skills/${SKILL_NAME}"
echo "📁 安装目标: ${TARGET_DIR}"
echo ""

# --- Step 2: 复制 skill 文件 ---
if [ -d "${TARGET_DIR}" ]; then
  read -rp "⚠ ${SKILL_NAME} 已存在，是否覆盖？[y/N] " OVERWRITE
  if [[ "${OVERWRITE}" != "y" && "${OVERWRITE}" != "Y" ]]; then
    echo "❌ 安装已取消。"
    exit 0
  fi
  rm -rf "${TARGET_DIR}"
fi

mkdir -p "${TARGET_DIR}"
cp "${SCRIPT_DIR}/SKILL.md" "${TARGET_DIR}/"
cp -r "${SCRIPT_DIR}/reference" "${TARGET_DIR}/"
cp "${SCRIPT_DIR}/test-prompts.json" "${TARGET_DIR}/"

echo "✅ Skill 文件已复制到 ${TARGET_DIR}"
echo ""

# --- Step 3: 交互式配置 ---
echo "📝 现在配置你的知识库路径和偏好..."
echo ""

# Obsidian vault path
read -rp "Obsidian 知识库根目录路径（例: /home/user/obsidian/vault）: " OBSIDIAN_VAULT
OBSIDIAN_VAULT="${OBSIDIAN_VAULT:-}"

# AI 对用户的称呼
read -rp "AI 对用户的称呼（默认: 兄弟）: " USER_CALL
USER_CALL="${USER_CALL:-兄弟}"

# 双向批注标识
read -rp "双向批注中的用户标识（默认: 用户）: " USER_TAG
USER_TAG="${USER_TAG:-用户}"

echo ""
echo "📝 配置摘要:"
echo "   Obsidian 路径: ${OBSIDIAN_VAULT:-（未设置）}"
echo "   用户称呼:      ${USER_CALL}"
echo "   批注标识:      ${USER_TAG}"
read -rp "确认无误？[Y/n] " CONFIRM
if [[ "${CONFIRM}" == "n" || "${CONFIRM}" == "N" ]]; then
  echo "❌ 安装已取消，请重新运行。"
  exit 0
fi

# --- Step 4: 替换 SKILL.md 中的占位符 ---
SKILL_FILE="${TARGET_DIR}/SKILL.md"

# 替换 Obsidian 路径占位符
if [ -n "${OBSIDIAN_VAULT}" ]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|\$OBSIDIAN_VAULT|${OBSIDIAN_VAULT}|g" "${SKILL_FILE}"
  else
    sed -i "s|\$OBSIDIAN_VAULT|${OBSIDIAN_VAULT}|g" "${SKILL_FILE}"
  fi
  echo "✅ Obsidian 路径已配置"
else
  # 保留原始占位符，用户可手动修改
  echo "⚠ Obsidian 路径未设置，请手动编辑 ${SKILL_FILE}"
fi

# 替换称呼占位符 {{CALL}}
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|{{CALL}}|${USER_CALL}|g" "${SKILL_FILE}"
  sed -i '' "s|{{TAG}}|${USER_TAG}|g" "${SKILL_FILE}"
else
  sed -i "s|{{CALL}}|${USER_CALL}|g" "${SKILL_FILE}"
  sed -i "s|{{TAG}}|${USER_TAG}|g" "${SKILL_FILE}"
fi
echo "✅ 个性化称呼已配置"

echo ""
echo "=============================================="
echo "  🎉 安装完成！"
echo "=============================================="
echo ""
echo "  现在你可以在 Claude Code 中使用以下触发词："
echo "  • 「记一下」— 记录日记"
echo "  • 「这个放哪」— 判断内容落位"
echo "  • 「帮我看看方向」— 方向诊断"
echo "  • 「帮我回顾」— 经验提炼"
echo ""
echo "  自动触发条件："
echo "  • 方向决策 / 关键资源更新 / 重大认知转折"
echo ""
echo "  提示：skill 会在下次对话加载时自动激活。"
echo "  如需立即使用，发送: /knowledge-base-habits"
echo ""
echo "  知识库位置: ${TARGET_DIR}"
if [ -n "${OBSIDIAN_VAULT}" ]; then
  echo "  Obsidian:    ${OBSIDIAN_VAULT}"
fi
echo "=============================================="
