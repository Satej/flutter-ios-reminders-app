
import 'package:flutter/material.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addList': (context) => const AddListScreen(),
        '/addReminder': (context) => const AddReminderScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.white,),
        accentColor: Colors.white,
        brightness: Brightness.dark,
        dividerColor: Colors.grey[600],
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.blueAccent,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
