import 'package:flutter/material.dart';
import '../services/file_sender.dart';
import '../services/discovery_service.dart';
import '../utils/permission_helper.dart';
import 'receiver_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _fileName;
  int? _fileSize;
  final discovery = DiscoveryService();
  final sender = FileSender();

  @override
  void initState() {
    super.initState();
    PermissionHelper.requestStorage();
    discovery.startDiscovery();
  }

  @override
  void dispose() {
    discovery.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final file = await sender.pickFile();
    if (file != null) {
      setState(() {
        _fileName = file.name;
        _fileSize = file.size;
      });
    }
  }

  void _sendFile(String ip) {
    if (_fileName != null) {
      sender.sendFile(ip);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SimpleDrop')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: _pickFile,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [6, 3],
                    color: Colors.blue,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.upload_file, size: 48),
                            const SizedBox(height: 16),
                            Text(_fileName ?? '拖放或点击选择文件'),
                            if (_fileSize != null)
                              Text('${_fileSize} bytes'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<String>>(
                stream: discovery.devices,
                builder: (context, snapshot) {
                  final devices = snapshot.data ?? [];
                  if (devices.isEmpty) {
                    return const Text('未发现设备');
                  }
                  return ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final ip = devices[index];
                      return ListTile(
                        title: Text(ip),
                        trailing: ElevatedButton(
                          onPressed: () => _sendFile(ip),
                          child: const Text('发送'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedBorder extends StatelessWidget {
  final Widget child;
  final BorderType borderType;
  final Radius radius;
  final List<int> dashPattern;
  final Color color;

  const DottedBorder({
    required this.child,
    this.borderType = BorderType.RRect,
    this.radius = const Radius.circular(4),
    this.dashPattern = const [4, 4],
    this.color = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(radius),
      ),
      child: child,
    );
  }
}

enum BorderType { RRect }
