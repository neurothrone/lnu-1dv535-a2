import 'package:flutter/material.dart';

import 'src/constants.dart';
import 'src/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: kOutlineInputBorder,
          enabledBorder: kOutlineInputBorder,
          focusedBorder: kOutlineInputBorder,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
