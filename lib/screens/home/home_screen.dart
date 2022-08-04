import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/screens/home/widgets/TodoLists.dart';
import 'package:ios_reminders/screens/home/widgets/list_view_items.dart';

import 'widgets/footer.dart';
import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String layoutType = 'grid';

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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: layoutType == 'grid'
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: GridViewItems(categories: categoryCollection.selectedCategories),
                  secondChild: ListViewItems(categoryCollection: categoryCollection),
                ),
                TodoLists(),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
