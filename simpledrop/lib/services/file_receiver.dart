import 'dart:io';
import 'package:http_server/http_server.dart';

class FileReceiver {
  HttpServer? _server;

  Future<void> startServer() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
    _server!.listen((request) async {
      if (request.method == 'POST' && request.uri.path == '/upload') {
        final body = await HttpBodyHandler.processRequest(request);
        if (body.body is HttpBodyFileUpload) {
          final upload = body.body as HttpBodyFileUpload;
          final file = File('/tmp/${upload.filename}');
          await file.writeAsBytes(upload.content);
        }
        request.response
          ..statusCode = HttpStatus.ok
          ..close();
      } else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..close();
      }
    });
  }

  void stop() => _server?.close();
}
