import 'package:flutter/material.dart';
import 'package:toonflix/screens/climate_dashboard/home_screen.dart';
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
            const NaviButton(
              screen: CurrencyScreen(),
              textColor: Colors.white,
              bgColor: Colors.red,
              btnText: 'Currency App',
            ),
            const SizedBox(
              height: 20,
            ),
            const NaviButton(
              screen: PomodoroHomeScreen(),
              textColor: Colors.black,
              bgColor: Colors.orange,
              btnText: 'Pomodoro App',
            ),
            const SizedBox(
              height: 20,
            ),
            NaviButton(
              screen: WebtoonHomeScreen(),
              textColor: Colors.black,
              bgColor: Colors.yellow,
              btnText: 'Webtoon App',
            ),
            const SizedBox(
              height: 20,
            ),
            NaviButton(
              screen: ClimateDashboardScreen(),
              textColor: Colors.white,
              bgColor: Colors.green.shade800,
              btnText: 'Climate Dashboard App',
            ),
          ],
        ),
      ),
    );
  }
}

class NaviButton extends StatelessWidget {
  final Widget screen;
  final String btnText;
  final Color textColor;
  final Color bgColor;

  const NaviButton({
    Key? key,
    required this.screen,
    required this.btnText,
    required this.textColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Button(
        text: btnText,
        bgColor: bgColor,
        textColor: textColor,
      ),
    );
  }
}
