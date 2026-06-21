#!/bin/bash
# ============================================
# 🔗 Obsidian + Quartz 一键接入脚本
# 你的 Obsidian 库: /Users/dongyebin/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai
# ============================================
set -e

OBSIDIAN_VAULT="/Users/dongyebin/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai"
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📚 正在接入 Obsidian 知识库..."
echo "   库路径: $OBSIDIAN_VAULT"
echo "   项目路径: $PROJECT_DIR"
echo ""

# 1. 检查 Obsidian 库是否存在
if [ ! -d "$OBSIDIAN_VAULT" ]; then
    echo "❌ 找不到 Obsidian 库: $OBSIDIAN_VAULT"
    echo "   请确认路径是否正确"
    exit 1
fi
echo "✅ Obsidian 库存在"

# 2. 删除默认 content 目录（如果存在且不是软链接）
if [ -L "$PROJECT_DIR/content" ]; then
    echo "🔗 content 已是软链接，跳过"
elif [ -d "$PROJECT_DIR/content" ]; then
    echo "🗑️  删除默认 content 目录..."
    rm -rf "$PROJECT_DIR/content"
fi

# 3. 创建软链接
if [ ! -L "$PROJECT_DIR/content" ] && [ ! -d "$PROJECT_DIR/content" ]; then
    echo "🔗 创建软链接..."
    ln -s "$OBSIDIAN_VAULT" "$PROJECT_DIR/content"
    echo "✅ 软链接已创建: content -> $OBSIDIAN_VAULT"
fi

# 4. 安装依赖
echo ""
echo "📦 安装 Node.js 依赖..."
npm install

# 5. 安装 Quartz 插件
echo ""
echo "🔌 安装 Quartz 社区插件..."
node ./quartz/bootstrap-cli.mjs plugin install

# 6. 构建预览
echo ""
echo "🏗️  构建网站..."
node ./quartz/bootstrap-cli.mjs build

echo ""
echo "============================================"
echo "✅ 接入完成！"
echo ""
echo "📝 接下来："
echo "   1. 修改 quartz.config.yaml 中的 baseUrl 为你的 GitHub 用户名"
echo "   2. 本地预览: node ./quartz/bootstrap-cli.mjs build --serve --port 8080"
echo "   3. 推送到 GitHub:"
echo "      git remote add origin https://github.com/RFAUnion/obsidian.git"
echo "      git add -A"
echo "      git commit -m '接入 Obsidian 知识库'"
echo "      git push -u origin main"
echo "============================================"
