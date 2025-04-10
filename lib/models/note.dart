class Note {
  String text;
  String? imagePath;  // Image will be nullable since it may not be part of every note

  Note({required this.text, this.imagePath});
}
