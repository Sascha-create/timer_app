import 'package:flutter/material.dart';
import 'package:timer_app/features/shared/app_home.dart';
import 'package:timer_app/features/stopwatch/stopwatch_screen.dart';
import 'package:timer_app/features/timer/timer_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHome(),
    );
  }
}
