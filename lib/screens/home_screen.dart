import 'package:flutter/material.dart';
import 'package:toonflix/screens/currency_screen.dart';
import 'package:toonflix/screens/pomodoro_screen.dart';
import 'package:toonflix/screens/webtoon/home_screen.dart';
import 'package:toonflix/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose App'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrencyScreen(),
                  ),
                );
              },
              child: const Button(
                text: 'Currency App',
                bgColor: Colors.red,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PomodoroHomeScreen(),
                  ),
                );
              },
              child: const Button(
                text: 'Pomodoro App',
                bgColor: Colors.orange,
                textColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebtoonHomeScreen(),
                  ),
                );
              },
              child: const Button(
                text: 'Webtoon App',
                bgColor: Colors.yellow,
                textColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
