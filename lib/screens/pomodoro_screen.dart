import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroHomeScreen extends StatefulWidget {
  const PomodoroHomeScreen({super.key});

  @override
  State<PomodoroHomeScreen> createState() => Pomodoro_HomeScreenState();
}

class Pomodoro_HomeScreenState extends State<PomodoroHomeScreen> {
  static const initSecond = 1500;
  int totalSeconds = initSecond;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = initSecond;
        totalPomodoros += 1;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = initSecond;
    });
  }

  String formatSec(int seconds) {
    var min = (seconds / 60).floor();
    var sec = seconds % 60;
    if (sec < 10) {
      return '$min:0$sec';
    } else {
      return '$min:$sec';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatSec(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: const Icon(Icons.stop_circle_outlined),
                    onPressed: onResetPressed,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
