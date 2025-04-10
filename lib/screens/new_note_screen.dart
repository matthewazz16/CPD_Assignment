import 'package:flutter/material.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final TextEditingController _controller = TextEditingController();
  String _savedNote = '';

  void _saveNote() {
    setState(() {
      _savedNote = _controller.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Note saved: $_savedNote')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Note')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Write something...'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
