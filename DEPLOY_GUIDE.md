# 🚀 部署指南

## 第一步：推送到你的 GitHub

```bash
# 1. 在 GitHub 上创建新仓库，例如：my-learning-site
#    https://github.com/new

# 2. 在本地项目目录中，修改远程仓库地址
git remote add origin https://github.com/YOUR_USERNAME/my-learning-site.git
git branch -M main
git push -u origin main
```

## 第二步：启用 GitHub Pages

1. 进入仓库 → **Settings** → **Pages**
2. **Source** 选择 **GitHub Actions**
3. 推送代码后，GitHub Actions 会自动构建部署
4. 几分钟后访问：`https://YOUR_USERNAME.github.io/my-learning-site`

## 第三步：在 Obsidian 中打开

1. 下载安装 [Obsidian](https://obsidian.md/)
2. 打开 Obsidian → **打开其他仓库** → 选择 `content` 文件夹
3. 开始写作！

## 第四步：日常使用流程

```bash
# 1. 在 Obsidian 中写笔记（自动保存到 content/ 目录）

# 2. 提交到 Git
git add content/
git commit -m "📝 更新学习笔记：HTML 基础完成"

# 3. 推送到 GitHub（自动部署）
git push
```

## 自定义配置

- **修改站点名称**：编辑 `quartz.config.yaml` 中的 `pageTitle`
- **修改域名**：编辑 `quartz.config.yaml` 中的 `baseUrl`
- **修改配色**：编辑 `quartz.config.yaml` 中的 `colors` 部分
- **添加/禁用功能**：编辑 `quartz.config.yaml` 中的 `plugins` 部分

## 本地预览

```bash
npm install
node ./quartz/bootstrap-cli.mjs plugin install
node ./quartz/bootstrap-cli.mjs build --serve --port 8080
# 浏览器打开 http://localhost:8080
```
