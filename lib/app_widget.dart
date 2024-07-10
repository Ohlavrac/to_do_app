import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/screens/create_task_screen.dart';

import 'presentation/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/create task": (context) => const CreateTaskScreen()
      }
    );
  }
}