import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(QuickNotesApp());
}

class QuickNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Notes',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}
