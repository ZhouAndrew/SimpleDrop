import 'package:flutter/material.dart';

class ReceiverDialog extends StatelessWidget {
  final String fileName;
  final int fileSize;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const ReceiverDialog({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('接收文件'),
      content: Text('是否接收 "$fileName" (${fileSize} bytes)?'),
      actions: [
        TextButton(onPressed: onDecline, child: const Text('拒绝')),
        ElevatedButton(onPressed: onAccept, child: const Text('接收')),
      ],
    );
  }
}
