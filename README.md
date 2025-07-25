# 📦 SimpleDrop

> 🚀 一款简洁高效的跨平台局域网文件传输工具，支持 Android / iOS / Windows / Linux。

---

## ✨ 项目简介

**SimpleDrop** 是一个使用 Flutter 构建的跨平台文件传输应用，支持在局域网内通过一个窗口将文件从一个设备发送到另一个设备，无需登录、注册、蓝牙或中转服务器。简单拖放，即可传送！

---

## 🎯 项目特性

- ✅ 跨平台支持：Android、iOS、Windows、Linux
- 🔍 局域网自动发现设备（基于 mDNS）
- 📤 文件拖放或浏览选择发送
- 📥 目标设备确认接收并保存
- ⚡ 即时显示传输进度
- 🔐 无需联网或云端，安全高效

---

## 🛠️ 安装方式

### 📱 Android / iOS
> 尚未发布到商店，可使用 Flutter 构建或通过 APK / IPA 安装测试版。

```bash
# 克隆项目
git clone https://github.com/yourusername/simpledrop.git
cd simpledrop

# 运行（需 Flutter 环境）
flutter run
````

### 💻 Windows / Linux

```bash
# 构建桌面版本
flutter build windows   # 或 flutter build linux
```

---

## 🚀 快速开始

1. 在两台设备上分别打开 SimpleDrop（连接同一个局域网）
2. 拖入或选择要发送的文件
3. 自动发现另一台设备，点击“发送”
4. 接收方窗口弹出确认框，确认后开始接收
5. 文件传输完成后保存在本地目录

---

## 🧱 技术栈

| 模块   | 技术                     |
| ---- | ---------------------- |
| UI   | Flutter                |
| 通信协议 | HTTP / WebSocket       |
| 设备发现 | mDNS (`bonsoir` 插件)    |
| 权限管理 | `permission_handler`   |
| 文件处理 | `file_picker`, Dart IO |

---

## 📂 项目结构概览

项目目录位于 `simpledrop/`，其下包含核心源码：

```
simpledrop/
└── lib/
    ├── main.dart
    ├── ui/
    │   ├── home_page.dart
    │   └── receiver_dialog.dart
    ├── services/
    │   ├── file_sender.dart
    │   ├── file_receiver.dart
    │   └── discovery_service.dart
    └── utils/
        └── permission_helper.dart
```

---

## 🧪 开发计划（Codex 跟踪中）

* [x] 完成基础 UI 和布局
* [x] 文件发送与接收逻辑实现
* [ ] 局域网设备自动发现
* [x] 权限适配（Android/iOS）
* [ ] 跨平台构建与打包测试
* [ ] 支持多文件批量发送
* [ ] 文件传输加密（可选）

---

## 🤝 开源协议

本项目使用 MIT License 发布，欢迎 Fork 与贡献。

---

## 📬 联系方式

有建议或反馈？欢迎通过 Issues 提交或联系作者。

```

