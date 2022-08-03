import 'package:flutter/material.dart';
import 'package:ios_reminders/models/common/custom_color_collection.dart';

import '../../models/common/custom_icon_collection.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({Key? key}) : super(key: key);

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: const Icon(Icons.home, size: 75),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: customColor.color,
                      shape: BoxShape.circle,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customIcon in CustomIconCollection().icons)
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(customIcon.icon),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
