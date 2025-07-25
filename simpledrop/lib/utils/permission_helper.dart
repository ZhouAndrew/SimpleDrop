import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<void> requestStorage() async {
    await Permission.storage.request();
  }
}
