
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/auth/authenticate_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('There was an error'),);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider<TodoListCollection>(
            create: (BuildContext context) => TodoListCollection(),
            child: MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const AuthenticateScreen(),
                '/home': (context) => const HomeScreen(),
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
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
