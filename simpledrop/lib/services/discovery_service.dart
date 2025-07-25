import 'dart:async';

class DiscoveryService {
  final _controller = StreamController<List<String>>.broadcast();
  Stream<List<String>> get devices => _controller.stream;

  Future<void> startDiscovery() async {
    // Placeholder for mDNS discovery using bonsoir
    // In a real implementation, discovered device IPs would be added to the stream
    _controller.add(const []); // emit empty list for now
  }

  void dispose() {
    _controller.close();
  }
}
