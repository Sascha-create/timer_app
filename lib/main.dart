import 'package:flutter/material.dart';
import 'package:timer_app/config/themes.dart';
import 'package:timer_app/features/shared/app_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: pixelTheme,
      home: const AppHome(),
    );
  }
}
