import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xffE64D3D),
          cardColor: Colors.white,
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 85,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontSize: 31,
              fontWeight: FontWeight.w900,
            )),
      ),
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
