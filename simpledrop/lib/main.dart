import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const SimpleDropApp());
}

class SimpleDropApp extends StatelessWidget {
  const SimpleDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDrop',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}
