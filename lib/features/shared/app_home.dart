import 'package:flutter/material.dart';
import 'package:timer_app/features/stopwatch/stopwatch_screen.dart';
import 'package:timer_app/features/timer/timer_screen.dart';

class AppHome extends StatefulWidget {
  const AppHome({
    super.key,
  });

  @override
  State<AppHome> createState() => _AppHomeState();
}

int currentIndex = 0;

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const TimerScreen(),
      const StopwatchScreen(),
    ];
    List<Widget> titles = const [Text("Timer"), Text("Stopwatch")];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade800,
          title: titles[currentIndex],
          titleTextStyle: const TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.watch_later_outlined), label: "Timer"),
              NavigationDestination(
                  icon: Icon(Icons.timer), label: "Stopwatch"),
            ]));
  }
}
