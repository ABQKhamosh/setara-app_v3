import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SetaraApp());
}

class SetaraApp extends StatelessWidget {
  const SetaraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setara - ستاره',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
      ),
      home: const HomeScreen(),
    );
  }
}
