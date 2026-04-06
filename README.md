# HomeMedicineBox

HomeMedicineBox 是一个面向中文家庭场景的本地健康记录应用方案，规划支持 iPhone 和安卓，目标是帮助家庭管理者更轻松地完成药品储备管理和医院就诊资料留存。

当前仓库收录的是首版 MVP 设计文档包，默认产品前提如下：

- 目标平台覆盖 `iPhone + 安卓`，当前版本按 `iPhone 优先` 推进，后续扩展安卓版本。
- 当前使用方式按 `单台手机管理全家` 设计，`v1 不做数据同步`。
- 产品长期规划支持 `多设备同步`，相关能力将在后续版本单独设计与落地。
- 数据和图片都保存在手机本地，不使用自建服务器。
- 允许通过第三方 AI 识别服务完成拍照结构化，但识别结果必须经用户确认后才能入库。
- MVP 聚焦 `药品管理`、`就诊档案`、`过期/库存提醒` 三项核心价值。

## 文档目录

- [产品需求文档 PRD](./docs/01-PRD.md)
- [体验设计文档](./docs/02-体验设计文档.md)
- [本地数据与 AI 方案文档](./docs/03-本地数据与AI方案.md)

## 建议阅读顺序

1. 先看 PRD，理解产品定位、用户、范围和边界。
2. 再看体验设计文档，理解信息架构、关键页面和核心交互。
3. 最后看本地数据与 AI 方案文档，作为研发拆分与技术评审依据。

## 当前工程状态

仓库已从纯文档包扩展为 `Flutter 本地优先 MVP 脚手架`，当前已落地：

- `Flutter + Riverpod` 的应用壳和页面骨架
- 面向后续 `Drift/SQLite` 的数据层蓝图
- 家庭成员、药品、批次、就诊、草稿、图片、提醒等核心领域模型
- `LocalRepository / DraftRepository / RecognitionProvider / ImageStore / ReminderEngine / SecurityGate` 边界定义
- 一套用于联调和演示的本地假实现与种子数据
- 首页、药品、就诊档案、草稿箱、设置页的代表性界面

## 工程目录

```text
lib/
├── main.dart
└── src/
    ├── app/
    ├── core/
    ├── data/
    │   ├── local/
    │   └── mock/
    ├── domain/
    ├── features/
    └── shared/
```

## 本地启动说明

当前环境没有安装 `Flutter SDK`，所以我这次实现没有直接生成 `ios/` 和 `android/` 平台壳，也无法执行 `flutter pub get`、`flutter test` 或 `build_runner`。

后续在本机安装 Flutter 后，可以按下面顺序继续：

1. 在仓库根目录执行 `flutter create . --platforms=ios,android`
2. 执行 `flutter pub get`
3. 运行 `dart run build_runner build`
4. 把 `lib/src/data/mock/` 的假实现逐步替换为真实本地实现

## 补充文档

- [工程落地说明](./docs/04-工程落地说明.md)
