import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the local notifications plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid = 
    AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = 
    InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(QuickNotesApp(flutterLocalNotificationsPlugin));
}

class QuickNotesApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  // Constructor to pass the plugin to HomeScreen
  const QuickNotesApp(this.flutterLocalNotificationsPlugin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Notes',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin),
    );
  }
}
