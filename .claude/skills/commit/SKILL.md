---
name: commit
description: 自动提交代码到 GitHub。用于当用户想要将本地修改提交并推送到 GitHub 仓库时。
disable-model-invocation: true
allowed-tools: Bash, Read, Glob, Grep
---

# 自动提交代码到 GitHub

当用户执行 `/commit` 命令时，按以下步骤执行：

1. 运行 `git status` 查看有哪些文件被修改
2. 运行 `git diff --stat` 查看具体变更内容

3. 判断描述来源：
   - **如果用户提供了 $ARGUMENTS**：使用用户提供的描述
   - **如果用户未提供 $ARGUMENTS**：分析变更内容，生成合适的中文描述

4. 执行 `git add -A` 添加所有更改
5. 执行 `git commit -m "提交描述"`
6. 执行 `git push` 推送到远程
7. 告诉用户提交成功，包含提交哈希
