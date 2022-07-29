import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category_collection.dart';
import 'package:ios_reminders/screens/home/list_view_items.dart';

import '../../models/category.dart';
import 'footer.dart';
import 'grid_view_items.dart';

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
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: layoutType == 'grid'
              ? GridViewItems(categories: categoryCollection.selectedCategories)
              : ListViewItems(categoryCollection: categoryCollection),
          ),
          const Footer(),
        ],
      ),
    );
  }
}