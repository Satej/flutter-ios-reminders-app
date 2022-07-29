import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category_collection.dart';

import '../../models/category.dart';
import 'footer.dart';
import 'grid_view_items.dart';

class HomeScreen extends StatelessWidget {

  CategoryCollection categoryCollection = CategoryCollection();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridViewItems(categoryCollection: categoryCollection),
          ),
          const Footer(),
        ],
      ),
    );
  }
}