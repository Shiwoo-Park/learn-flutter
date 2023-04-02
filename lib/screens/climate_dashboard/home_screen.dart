import 'package:flutter/material.dart';
import 'package:toonflix/screens/climate_dashboard/clock_screen.dart';
import 'package:toonflix/screens/climate_dashboard/feed_screen.dart';
import 'package:toonflix/screens/climate_dashboard/sealevel_screen.dart';

class ClimateDashboardScreen extends StatefulWidget {
  @override
  _ClimateDashboardScreenState createState() => _ClimateDashboardScreenState();
}

class _ClimateDashboardScreenState extends State<ClimateDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ClimateFeedScreen(),
    ClimateClockScreen(),
    ClimateSealevelScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Heating Status'),
        backgroundColor: Colors.red.shade800,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red.shade800,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'ClimateClock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'SeaLevel',
          ),
        ],
      ),
    );
  }
}
