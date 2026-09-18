import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

const kPrimaryColor = Color(0xFF0A0E21);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const InputScreen(),
    );
  }
}
