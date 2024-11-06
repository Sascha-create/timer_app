import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({
    super.key,
  });

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

int counterMilliSeconds = 0;
int counterSeconds = 0;
int counterMinutes = 0;

bool isStarted = false;

Future<int> count() {
  return Future.delayed(const Duration(milliseconds: 1), () => 1);
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
                    '$counterMinutes'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800),
                    ':'),
                Text(
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800),
                    '$counterSeconds'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800),
                    ':'),
                Text(
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800),
                    '$counterMilliSeconds'),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      isStarted = true;
                      while (isStarted) {
                        counterMilliSeconds += await count();
                        if (counterMilliSeconds == 1000) {
                          counterSeconds += 1;
                          counterMilliSeconds = 0;
                          if (counterSeconds == 60) {
                            counterMinutes += 1;
                            counterSeconds = 0;
                          }
                        }
                        setState(() {});
                      }
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
                        counterMilliSeconds = 0;
                        counterSeconds = 0;
                        counterMinutes = 0;
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
