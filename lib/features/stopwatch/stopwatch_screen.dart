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

Future<int> countMilliseconds() {
  return Future.delayed(const Duration(milliseconds: 7), () => 1);
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      counterMinutes < 10
                          ? '0$counterMinutes'
                          : '$counterMinutes'),
                ),
                SizedBox(
                  width: 20,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      counterSeconds % 2 == 0 ? ":" : " "),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      counterSeconds < 10
                          ? '0$counterSeconds'
                          : '$counterSeconds'),
                ),
                SizedBox(
                  width: 20,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      counterSeconds % 2 == 0 ? ":" : " "),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade800),
                      counterMilliSeconds < 10
                          ? '0$counterMilliSeconds'
                          : '$counterMilliSeconds'),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      isStarted = true;

                      while (isStarted) {
                        counterMilliSeconds += await countMilliseconds();
                        if (counterMilliSeconds == 100) {
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
