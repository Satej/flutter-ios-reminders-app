import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/category_icon.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/home/widgets/list_view_items.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:provider/provider.dart';

import '../../models/common/custom_color_collection.dart';
import '../../models/common/custom_icon_collection.dart';
import 'widgets/footer.dart';
import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String layoutType = 'grid';

  addNewList(TodoList list) {
    print('add list from home screen');
    print(list.title);
    Provider.of<TodoListCollection>(context, listen: false).addTodoList(list);
  }

  deleteTodoList(TodoList list) {
    Provider.of<TodoListCollection>(context, listen: false)
        .removeTodoList(list);
  }

  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    var todoLists = Provider.of<TodoListCollection>(context).todoLists;
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Lists',
                    style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: todoLists.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction) {
                            deleteTodoList(todoLists[index]);
                          },
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Icon(Icons.delete),
                            ),
                          ),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: ListTile(
                              leading: CategoryIcon(
                                bgColor: (CustomColorCollection().findColorById(
                                  todoLists[index].icon['color']).color
                                ),
                                iconData: (CustomIconCollection().findIconById(
                                    todoLists[index].icon['id'])).icon,
                              ),
                              trailing: Text(
                                '0',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              title: Text(todoLists[index].title),),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(addNewListCallback: (todoList) => addNewList(todoList)),
        ],
      ),
    );
  }
}