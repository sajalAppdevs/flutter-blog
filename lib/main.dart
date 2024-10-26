import 'package:blog_club/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFont = 'Avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0xff0D253C);
    final secondryTextColor = const Color.fromARGB(255, 110, 127, 172);
    return MaterialApp(
      title: 'Blog Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          textTheme: TextTheme(
              bodySmall: TextStyle(
                color: secondryTextColor,
                fontFamily: defaultFont,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                  color: secondryTextColor,
                  fontFamily: defaultFont,
                  fontWeight: FontWeight.bold),
              headlineSmall: TextStyle(
                  color: primaryTextColor,
                  fontFamily: defaultFont,
                  fontWeight: FontWeight.bold))),
      home: const HomeScreen(),
    );
  }
}
