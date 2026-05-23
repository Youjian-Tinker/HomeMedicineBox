# HomeMedicineBox

HomeMedicineBox 是一个面向中文家庭场景的本地健康资料管理应用，规划支持 iPhone 和 Android，目标是帮助家庭管理者管理药品储备、过期/库存提醒和医院就诊资料。

当前仓库保留的是产品需求、体验设计、数据与 AI 方案，以及直接产品化落地所需的 Flutter 工程代码。默认产品前提如下：

- 首版使用 `Flutter` 跨端落地，按 `iPhone 优先` 做体验和真机验收，Android 保持同一信息架构。
- 当前使用方式按 `单台手机管理全家` 设计，`v1 不做数据同步`。
- 数据和图片保存在手机本地，不使用自建服务器保存健康资料。
- 拍照识别通过可配置云端 AI 服务完成；未配置或识别失败时，必须允许用户转为手动录入。
- AI 识别结果必须进入草稿确认流程，用户确认后才写入正式记录。
- MVP 聚焦 `药品管理`、`就诊档案`、`过期/库存提醒` 三项核心价值。

## 文档目录

- [产品需求文档 PRD](./docs/01-PRD.md)
- [体验设计文档](./docs/02-体验设计文档.md)
- [本地数据与 AI 方案文档](./docs/03-本地数据与AI方案.md)
- [工程落地说明](./docs/04-工程落地说明.md)

## 工程状态

仓库正在从文档包进入正式 Flutter 产品化实现，当前工程代码按以下边界组织：

- `Riverpod` 管理应用状态。
- `go_router` 管理主要页面路由。
- 领域层覆盖家庭成员、药品、批次、就诊、医疗文档、识别草稿和本地图像。
- `RecognitionService` 抽象可配置云端 AI 调用，失败时生成可手动补录的草稿。
- `ReminderEngine` 负责过期、即将过期、库存不足等本地提醒计算。
- 基础自动化测试只覆盖高风险业务逻辑，不建设完整功能自动化测试套件。

## 工程目录

```text
lib/
├── main.dart
└── src/
    ├── app/
    ├── data/
    ├── domain/
    └── features/

test/
├── draft_service_test.dart
├── image_cleanup_test.dart
├── recognition_service_test.dart
└── reminder_engine_test.dart
```

## 本地开发

本机需要先安装 Flutter stable，并通过 `flutter doctor` 修复 iOS / Android 开发环境。

```bash
flutter pub get
flutter create . --platforms=ios,android
flutter test
```

AI 服务通过运行时配置注入，不提交 API Key。未配置 AI 时，应用仍应允许用户完成手动录入。
