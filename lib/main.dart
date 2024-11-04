import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade800,
          title: const Text("Stopwatch"),
          titleTextStyle: const TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      'Sekunden'),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      's'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Start")),
                  const SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Stop")),
                  const SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Clear")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
