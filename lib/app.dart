import 'package:flutter/material.dart';

import 'Screens/home/calculator_front.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maths master 69',
      initialRoute: '/',
      routes: {'/': (context) => const CalculatorFront()},
    );
  }
}
