# 🔗 接入你本地已有的 Obsidian 知识库

你的 Obsidian 库已经在本地了，只需要把它和 Quartz 网站项目关联起来即可。

## 方案一：软链接（推荐，最简单）

在终端执行以下命令，把你的 Obsidian 库链接到 Quartz 的 content 目录：

```bash
# 1. 进入项目目录
cd /path/to/my-learning-site

# 2. 删除默认的 content 目录
rm -rf content

# 3. 创建软链接，指向你本地的 Obsidian 库
ln -s "/你的Obsidian库路径" content

# 例如：
# macOS:  ln -s ~/Documents/MyObsidianVault content
# Windows (管理员PowerShell): New-Item -ItemType SymbolicLink -Path content -Target "D:\Obsidian\MyVault"
```

### 验证

```bash
ls content/
# 应该能看到你 Obsidian 库里的所有文件和文件夹
```

---

## 方案二：修改 Quartz 配置，指定外部内容目录

如果你不想用软链接，可以直接在 `quartz.config.yaml` 中指定内容路径。

但目前 Quartz 默认使用 `content/` 作为内容目录，软链接是最简单的方式。

---

## 接入后需要调整的配置

1. **编辑 `quartz.config.yaml`**：
   - `baseUrl`：改成 `你的GitHub用户名.github.io`
   - `pageTitle`：改成你想要的网站标题
   - `ignorePatterns`：确保你的 Obsidian 私有文件夹不被发布，例如添加：
     ```yaml
     ignorePatterns:
       - private
       - templates
       - .obsidian
       - .trash
       - attachments
       - daily  # 如果你有日记不想公开
     ```

2. **安装插件并构建测试**：
   ```bash
   npm install
   node ./quartz/bootstrap-cli.mjs plugin install
   node ./quartz/bootstrap-cli.mjs build --serve --port 8080
   # 浏览器打开 http://localhost:8080 预览
   ```

3. **推送到 GitHub 自动部署**：
   ```bash
   git remote add origin https://github.com/你的用户名/my-learning-site.git
   git add -A
   git commit -m "接入本地 Obsidian 库"
   git push -u origin main
   ```

---

## ⚠️ 注意事项

- 软链接方式下，**你的 Obsidian 库就是 content 目录**，所有改动即时生效
- `.obsidian/` 配置目录会被自动忽略（已在配置中设置）
- 如果某些笔记不想发布，把它们放到 `private/` 文件夹或添加到 `ignorePatterns`
- 建议在 Obsidian 笔记的 frontmatter 中添加 `draft: true` 来标记草稿（配合 `remove-draft` 插件）
