
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo_list/todo_list_collection.dart';
import 'add_list/add_list_screen.dart';
import 'add_reminder/add_reminder_screen.dart';
import 'auth/authenticate_screen.dart';
import 'home/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);

    return ChangeNotifierProvider<TodoListCollection>(
      create: (BuildContext context) => TodoListCollection(),
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
          '/addList': (context) => const AddListScreen(),
          '/addReminder': (context) => const AddReminderScreen(),
        },
        home: user != null ? const HomeScreen() : const AuthenticateScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),
          iconTheme: const IconThemeData(color: Colors.white,),
          accentColor: Colors.white,
          brightness: Brightness.dark,
          dividerColor: Colors.grey[600],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
          ),
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
      ),
    );
  }
}
