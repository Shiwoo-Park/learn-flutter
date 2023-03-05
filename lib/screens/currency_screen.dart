import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Hey, Shiwoo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '\$5 194 482',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    text: "Transfer",
                    bgColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "Request",
                    bgColor: Color(0xff1f2123),
                    textColor: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrencyCard(
                name: 'Euro',
                amount: '6 428',
                code: 'EUR',
                iconData: Icons.euro_rounded,
                order: 0,
              ),
              const CurrencyCard(
                name: 'Bitcoin',
                amount: '1 208',
                code: 'BTC',
                iconData: Icons.currency_bitcoin,
                order: 1,
                isInverted: true,
              ),
              const CurrencyCard(
                name: 'Dollar',
                amount: '12 735',
                code: 'USD',
                order: 2,
                iconData: Icons.attach_money_outlined,
              ),
              const CurrencyCard(
                name: 'Yen',
                amount: '25 300',
                code: 'JPY',
                iconData: Icons.currency_yen_rounded,
                order: 3,
                isInverted: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
