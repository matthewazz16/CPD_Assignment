import 'package:flutter/material.dart';
import 'new_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quick Notes')),
      body: Center(
        child: ElevatedButton(
          child: Text('Create New Note'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewNoteScreen()),
            );
          },
        ),
      ),
    );
  }
}
