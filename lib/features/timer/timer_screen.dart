import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    super.key,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

TextEditingController timeController = TextEditingController();

Future<int> countSeconds() {
  return Future.delayed(const Duration(seconds: 1), () => 1);
}

String showSeconds(int secondCounter) {
  switch (secondCounter) {
    case < 10:
      return "00$secondCounter";
    case >= 10 && <= 99:
      return "0$secondCounter";
    case >= 100:
      return "$secondCounter";
    default:
      return "$secondCounter";
  }
}

bool isStarted = false;
int secondCounter = 0;

class _TimerScreenState extends State<TimerScreen> {
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
                  width: 120,
                  child: Text(
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: secondCounter == 0
                              ? Colors.green
                              : Colors.deepPurple.shade800),
                      showSeconds(secondCounter)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: secondCounter == 0
                            ? Colors.green
                            : Colors.deepPurple.shade800),
                    's'),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 56.0, vertical: 24),
              child: TextFormField(
                style: const TextStyle(fontSize: 24),
                controller: timeController,
                decoration: const InputDecoration(
                    label: Text(style: TextStyle(fontSize: 22), "Timer")),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        secondCounter = int.parse(timeController.text);
                      });
                    },
                    child: const Text("Set")),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    onPressed: () async {
                      isStarted = true;
                      while (secondCounter > 0 && isStarted) {
                        int count = await countSeconds();
                        secondCounter -= count;
                        setState(() {});
                      }
                    },
                    child: const Text("Start")),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isStarted = false;
                      });
                    },
                    child: const Text("Stop")),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        secondCounter = 0;
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


