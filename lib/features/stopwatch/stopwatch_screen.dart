import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({
    super.key,
  });

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

int counter = 0;
bool isStarted = false;

Future<int> count() {
  return Future.delayed(Duration(seconds: 1), () => 1);
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    '$counter'),
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
                ElevatedButton(
                    onPressed: () async {
                      isStarted = true;
                      while (isStarted) {
                        counter += await count();
                        setState(() {});
                      }
                      ;
                    },
                    child: const Text("Start")),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      isStarted = false;
                    },
                    child: const Text("Stop")),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: const Text("Clear")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
