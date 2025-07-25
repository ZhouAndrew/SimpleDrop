import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class PickedFile {
  final String path;
  final String name;
  final int size;

  PickedFile(this.path, this.name, this.size);
}

class FileSender {
  File? _file;

  Future<PickedFile?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      _file = file;
      return PickedFile(
        file.path,
        result.files.single.name,
        result.files.single.size,
      );
    }
    return null;
  }

  Future<void> sendFile(String ip) async {
    if (_file == null) return;
    final uri = Uri.parse('http://$ip:8080/upload');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', _file!.path));
    await request.send();
  }
}
