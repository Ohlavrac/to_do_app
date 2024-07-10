import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
      }
    );
  }
}