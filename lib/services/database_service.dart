import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/reminders/reminder.dart';
import '../models/todo_list/todo_list.dart';

class DatabaseService {
  final String uid;
  final DocumentReference _userRef;

  DatabaseService({required this.uid})
      : _userRef = FirebaseFirestore.instance.collection('users').doc(uid);

  Stream<List<TodoList>> todoListStream() {
    return _userRef.collection('todo_lists').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (todoListSnapshot) => TodoList.fromJson(
                  todoListSnapshot.data(),
                ),
              )
              .toList(),
        );
  }

  Stream<List<Reminder>> remindersStream() {
    return _userRef.collection('reminders').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (reminderSnapshot) => Reminder.fromJson(
                  reminderSnapshot.data(),
                ),
              )
              .toList(),
        );
  }

  addTodoList({required TodoList todoList}) async {
    final todoListRef = _userRef.collection('todo_lists').doc();
    todoList.id = todoListRef.id;

    try {
      await todoListRef.set(todoList.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
