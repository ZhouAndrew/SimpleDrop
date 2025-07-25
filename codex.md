# 📦 SimpleDrop Codex 任务列表

## ✅ 基础架构
- [x] 初始化 Flutter 项目，命名为 `simpledrop`
- [x] 添加必要依赖：`file_picker`, `bonsoir`, `http`, `permission_handler`

## 🖼️ UI 设计
- [x] 创建 `HomePage` 界面，包含：
  - [x] 拖放或选择文件的区域
  - [x] 显示已选择文件名和大小
  - [x] 显示发现到的设备（局域网内）
  - [x] “发送”按钮
- [x] 创建 `ReceiverDialog` 界面，用于接收文件时弹出确认窗口

## 🔄 文件传输逻辑
- [x] 实现文件选择器（桌面/移动端适配）
- [x] 启动 HTTP server，监听接收上传的文件
- [x] 实现客户端通过 HTTP 上传文件至目标设备
- [x] 接收端保存文件到本地路径

## 🌐 设备发现
- [ ] 集成 `bonsoir` 进行 mDNS 广播与扫描
- [ ] 显示发现到的设备及其 IP 地址

## 📂 权限与平台支持
- [x] 实现 Android 运行时权限申请（存储）
- [ ] 实现 iOS 权限处理（必要 Info.plist 权限配置）
- [ ] 桌面端直接写入 Downloads 目录
- [ ] 提供接收文件保存路径选项（可选）

## 📈 文件传输状态
- [ ] 实现进度条显示（文件发送/接收）
- [ ] 传输完成通知与提示
