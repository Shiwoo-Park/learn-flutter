import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/models/carbon_deadline.dart';
import 'package:toonflix/services/climate_apis.dart';

class ClimateClockScreen extends StatefulWidget {
  const ClimateClockScreen({super.key});

  @override
  State<ClimateClockScreen> createState() => _ClimateClockScreenState();
}

class _ClimateClockScreenState extends State<ClimateClockScreen> {
  late Future<CarbonDeadline> carbonDeadline;
  late Duration durationLeft;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    carbonDeadline = ClimateApiService.getCarbonDeadline();
  }

  void onTick(Timer timer) {
    if (durationLeft.inSeconds <= 0) {
      timer.cancel();
    } else {
      setState(() {
        durationLeft = durationLeft - const Duration(seconds: 1);
      });
    }
  }

  @override
  void dispose() {
    durationLeft = const Duration(seconds: 0);
    super.dispose();
  }

  void setupScreen(String dateSt) {
    DateTime deadline = DateTime.parse(dateSt);
    DateTime now = DateTime.now();
    durationLeft = deadline.difference(now);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  String getYearsLeft() {
    return (durationLeft.inDays ~/ 365).toString();
  }

  String getDaysLeft() {
    return (durationLeft.inDays % 365).toString();
  }

  String getTimeLeft() {
    // int years = 0;
    // int days = durationLeft.inDays;
    // years = days ~/ 365;
    // days = days % 365;

    List<String> timeParts = durationLeft.toString().split(':');
    int hours = int.parse(timeParts[0]) % 24;
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2].split('.')[0]);

    // return "${years}yrs ${days}days\n"
    //     "${hours}hrs ${minutes}min ${seconds}sec";
    // return "${years}YRS ${days}DAYS\n"
    //     "$hours:$minutes:$seconds";

    return "$hours:$minutes:$seconds";
  }

  void showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('IF TIMER HITS ZERO,'),
          content: const Text(
              'DEVASTATING GLOBAL CLIMATE IMPACTS would be VERY HIGH.\n\nHuman beings would have NO CHANCE to recover the peaceful earth.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double deadlineTextSize = screenWidth * 0.13;
    final double descTextSize = screenWidth * 0.09;
    final double clockTextSize = screenWidth * 0.13;
    final double clockSubTextSize = screenWidth * 0.08;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'DEADLINE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: deadlineTextSize,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "TIME LEFT TO LIMIT GLOBAL HEATING TO 1.5°C",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: descTextSize,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FutureBuilder(
            future: carbonDeadline,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                setupScreen(snapshot.data!.timestamp);

                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            getYearsLeft(),
                            style: TextStyle(
                              fontSize: clockTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "YRS",
                            style: TextStyle(
                              fontSize: clockSubTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            getDaysLeft(),
                            style: TextStyle(
                              fontSize: clockTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "DAYS",
                            style: TextStyle(
                              fontSize: clockSubTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        getTimeLeft(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: clockTextSize,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          IconButton(
              onPressed: showPopup,
              icon: Icon(
                Icons.help_outline_outlined,
                size: deadlineTextSize,
              ))
        ],
      ),
    );
  }
}
