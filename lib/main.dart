import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Main class
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), 
    );
  }
}
