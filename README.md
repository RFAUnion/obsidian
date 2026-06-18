# 📚 我的学习笔记

使用 **Obsidian** 编写，通过 **Quartz 5** 构建发布的个人学习网站。

> 🔗 在线访问：[https://rfaunion.github.io/my-learning-site](https://rfaunion.github.io/my-learning-site)

## 🚀 本地开发

```bash
# 安装依赖
npm install

# 安装社区插件
node ./quartz/bootstrap-cli.mjs plugin install

# 启动开发服务器
node ./quartz/bootstrap-cli.mjs build --serve --port 8080
```

## 🔗 接入 Obsidian 库

项目已配置好软链接方案，运行一键脚本即可：

```bash
chmod +x setup.sh
./setup.sh
```

Obsidian 库路径：`/Users/dongyebin/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai`

## 📁 目录结构

```
content/          # → Obsidian 库（软链接）
quartz.config.yaml  # 网站配置
.github/workflows/  # 自动部署
```

## 🛠️ 技术栈

- [Obsidian](https://obsidian.md/) — 笔记编辑器
- [Quartz 5](https://quartz.jzhao.xyz/) — 静态网站生成器
- [GitHub Pages](https://pages.github.com/) — 网站托管
- [GitHub Actions](https://github.com/features/actions) — 自动部署

---

> 基于 [Quartz](https://github.com/jackyzha0/quartz) 构建
