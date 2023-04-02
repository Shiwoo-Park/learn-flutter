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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'DEADLINE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "TIME LEFT TO LIMIT GLOBAL HEATING TO 1.5°C",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                            style: const TextStyle(
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "YRS",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            getDaysLeft(),
                            style: const TextStyle(
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "DAYS",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        getTimeLeft(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
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
        ],
      ),
    );
  }
}
