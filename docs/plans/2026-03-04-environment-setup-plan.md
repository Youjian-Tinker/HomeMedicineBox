# 环境验证实施计划

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 在 Windows 上验证开发环境，创建可运行的 Taro + React 微信小程序项目

**Architecture:** 通过命令行工具链验证 + Taro CLI 初始化项目结构

**Tech Stack:** Node.js, npm, Git, Taro CLI, 微信开发者工具

---

## 任务概览

| 任务 | 描述 |
|------|------|
| Task 1 | 检查并安装 Node.js 和 npm |
| Task 2 | 安装 Taro CLI |
| Task 3 | 初始化 Taro 项目 |
| Task 4 | 安装项目依赖 |
| Task 5 | 验证开发环境 |
| Task 6 | 用微信开发者工具预览 |

---

## Task 1: 检查并安装 Node.js 和 npm

**目标:** 确认 Node.js 和 npm 已安装且版本兼容

**Step 1: 检查当前版本**

打开终端（cmd 或 PowerShell），运行：
```bash
node -v
npm -v
```

预期输出：
```
v20.x.x   (或 v18.x.x)
9.x.x    (或 10.x.x)
```

**如果已安装** → 跳过 Task 1，直接进入 Task 2

**如果未安装或版本过低** → 继续下一步

**Step 2: 下载并安装 Node.js**

1. 打开浏览器访问: https://nodejs.org/
2. 下载 LTS（长期支持版）Windows 安装包
3. 运行安装程序，全部选择默认选项
4. 安装完成后重新打开终端
5. 验证: `node -v` 和 `npm -v`

---

## Task 2: 安装 Taro CLI

**目标:** 全局安装 Taro 脚手架工具

**Step 1: 安装 Taro CLI**

在终端运行：
```bash
npm install -g @tarojs/cli
```

可能需要等待 1-2 分钟，显示进度条

**Step 2: 验证安装**

```bash
taro --version
```

预期输出：
```
@tarojs/cli: 4.x.x
```

**常见问题:**
- 如果安装失败，尝试管理员权限运行终端
- 如果很慢，配置国内镜像：
  ```bash
  npm config set registry https://registry.npmmirror.com
  ```

---

## Task 3: 初始化 Taro 项目

**目标:** 创建小程序项目基础结构

**Step 1: 创建项目**

在终端运行：
```bash
cd D:\AI-Workspace\HomeMedicineBox
taro init HomeMedicineBox
```

**Step 2: 选择配置选项**

按照提示选择：
```
? 请选择 React 框架 (Use arrow keys)
  > React

? 请选择编译方式 (Use arrow keys)
  > 微信小程序

? 是否需要 TypeScript (Use arrow keys)
  > Yes

? 请选择 CSS 预处理器 (Use arrow keys)
  > Sass

? 请选择包管理器 (Use arrow keys)
  > npm
```

等待项目创建完成

**Step 3: 验证目录结构**

创建完成后，检查目录：
```
HomeMedicineBox/
├── src/
│   ├── pages/
│   │   └── index/
│   │       ├── index.tsx
│   │       └── index.scss
│   ├── app.config.ts
│   ├── app.tsx
│   └── app.scss
├── config/
├── package.json
└── project.config.json
```

---

## Task 4: 安装项目依赖

**目标:** 安装项目所需的所有 npm 包

**Step 1: 进入项目目录**

```bash
cd D:\AI-Workspace\HomeMedicineBox\HomeMedicineBox
```

**Step 2: 安装依赖**

```bash
npm install
```

等待安装完成（可能需要 2-5 分钟）

**Step 3: 验证 node_modules**

检查目录中是否存在 `node_modules` 文件夹

---

## Task 5: 验证开发环境

**目标:** 确保项目可以正常编译

**Step 1: 运行开发命令**

```bash
npm run dev:weapp
```

等待编译完成，预期输出：
```
✅ 编译成功
```

**Step 2: 检查输出目录**

确认生成了 `dist/` 目录：
```
dist/
├── app.js
├── app.json
├── app.wxss
└── pages/
    └── index/
        ├── index.js
        ├── index.json
        ├── index.wxss
        └── index.wxml
```

---

## Task 6: 用微信开发者工具预览

**目标:** 在真实小程序环境中查看效果

**Step 1: 下载微信开发者工具**

如果未安装，访问:
https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html

下载并安装

**Step 2: 导入项目**

1. 打开微信开发者工具
2. 点击 "导入项目"
3. 选择目录: `D:\AI-Workspace\HomeMedicineBox\HomeMedicineBox\dist`
4. AppID: 可以选择"测试号"（点击使用测试号）

**Step 3: 预览**

确认看到默认的 Taro 页面（Hello World）

---

## 验收检查清单

- [ ] `node -v` 返回 v18.x 或 v20.x
- [ ] `npm -v` 返回 9.x 或 10.x
- [ ] `taro --version` 返回 4.x
- [ ] `npm run dev:weapp` 成功生成 dist/ 目录
- [ ] 微信开发者工具能打开并预览空白项目

---

## 后续功能开发

环境验证完成后，可以开始实现设计文档中的功能模块：
1. 成员管理模块（pages/members）
2. 生病记录模块（pages/illness）
3. 药品管理模块（pages/medicine）
4. 设置页面（pages/settings）
