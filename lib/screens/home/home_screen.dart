import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/screens/home/widgets/list_view_items.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';

import 'widgets/footer.dart';
import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String layoutType = 'grid';

  List<TodoList> todoLists = [];

  addNewList(TodoList list) {
    print('add list from home screen');
    print(list.title);
    setState(() {
      todoLists.add(list);
    });
  }

  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              layoutType = layoutType == 'grid' ? 'list' : 'grid';
              setState(() {
                layoutType = layoutType;
              });
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : 'Done',
              //style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: layoutType == 'grid'
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
            firstChild: GridViewItems(categories: categoryCollection.selectedCategories),
            secondChild: ListViewItems(categoryCollection: categoryCollection),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                return ListTile(leading: Text(todoLists[index].title),);
              },
            ),
          ),
          Footer(addNewListCallback: (todoList) => addNewList(todoList)),
        ],
      ),
    );
  }
}