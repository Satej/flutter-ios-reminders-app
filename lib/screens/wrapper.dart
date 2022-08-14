
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/reminders/reminder.dart';
import 'package:provider/provider.dart';

import '../models/todo_list/todo_list.dart';
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
    final todoListStream = FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('todo_lists')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (todoListSnapshot) => TodoList.fromJson(
            todoListSnapshot.data(),
          ),
        ).toList(),
      );

    final remindersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('reminders')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (reminderSnapshot) => Reminder.fromJson(
            reminderSnapshot.data(),
          ),
        ).toList(),
      );

    return MultiProvider(
      providers: [
        StreamProvider<List<TodoList>>.value(
          initialData: const [],
          value: todoListStream,
        ),
        StreamProvider<List<Reminder>>.value(
          value: remindersStream,
          initialData: const [],
        ),
      ],
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
