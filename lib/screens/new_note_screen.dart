// lib/screens/new_note_screen.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/note.dart'; 
import 'dart:io'; 


class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({Key? key}) : super(key: key);

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  TextEditingController controller = TextEditingController();
  String? imagePath; 

 
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path; 
      });
    }
  }

 
  void _saveNote() {
    String text = controller.text;
    Note note = Note(text: text, imagePath: imagePath);
    Navigator.pop(context, note); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter note text'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Take a Photo'),
            ),
            SizedBox(height: 10),
            imagePath != null
                ? Image.file(File(imagePath!)) 
                : Container(), 
            SizedBox(height: 10),
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
