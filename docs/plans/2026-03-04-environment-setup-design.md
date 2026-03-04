# 环境验证与项目初始化设计方案

**文档版本**: v1.0
**创建日期**: 2026-03-04
**目标**: 在 Windows 上搭建 Taro + React 开发环境，创建小程序项目基础结构

---

## 1. 背景

家庭小药箱项目处于初始阶段，仅有设计文档，尚未开始代码开发。用户为 Windows 新手，希望先验证开发环境能够正常运行，再进行功能开发。

---

## 2. 目标

1. 确认开发工具链完整可用（Node.js、npm、Git、Taro CLI）
2. 创建一个可运行的 Taro + React 微信小程序项目
3. 能够在微信开发者工具中预览

---

## 3. 方案详情

### 3.1 前置检查

用户需要确认已安装以下工具：

| 工具 | 验证命令 | 作用 |
|------|----------|------|
| Node.js | `node -v` | JavaScript 运行时 |
| npm | `npm -v` | 包管理器 |
| Git | `git --version` | 版本控制 |
| 微信开发者工具 | 手动打开 | 小程序预览 |

### 3.2 项目初始化流程

```
步骤1: 验证/安装 Node.js 和 npm
  - 检查版本: node -v, npm -v
  - 如未安装，下载 Node.js LTS 版本

步骤2: 安装 Taro CLI
  - 命令: npm install -g @tarojs/cli
  - 验证: taro --version

步骤3: 初始化项目
  - 命令: taro init HomeMedicineBox
  - 选项: React + TypeScript + Sass

步骤4: 安装依赖
  - 命令: cd HomeMedicineBox && npm install

步骤5: 验证开发环境
  - 命令: npm run dev:weapp
  - 预期: 生成 dist/ 目录

步骤6: 预览小程序
  - 用微信开发者工具打开 dist/ 目录
```

### 3.3 预期目录结构

```
HomeMedicineBox/
├── src/                  # 源代码
│   ├── pages/           # 页面
│   ├── components/      # 组件
│   ├── app.config.ts    # 全局配置
│   ├── app.scss         # 全局样式
│   └── index.tsx        # 入口
├── dist/                # 编译输出（微信小程序）
├── config/              # Taro 配置
├── package.json
├── tsconfig.json
└── project.config.json
```

---

## 4. 风险与预案

| 风险 | 应对方案 |
|------|----------|
| Node.js 版本不兼容 | 使用 nvm-windows 管理多版本 |
| npm 安装慢/失败 | 配置淘宝镜像: npm config set registry https://registry.npmmirror.com |
| 微信开发者工具未安装 | 下载: https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html |
| Taro CLI 安装失败 | 尝试管理员权限运行终端 |

---

## 5. 验收标准

- [ ] `node -v` 返回 v18.x 或 v20.x
- [ ] `npm -v` 返回 9.x 或 10.x
- [ ] `taro --version` 返回 4.x
- [ ] `npm run dev:weapp` 成功生成 dist/ 目录
- [ ] 微信开发者工具能打开并预览空白项目

---

## 6. 后续步骤

环境验证完成后，按设计文档中的目录结构逐步实现：
1. 成员管理模块（pages/members）
2. 生病记录模块（pages/illness）
3. 药品管理模块（pages/medicine）
4. 设置页面（pages/settings）
