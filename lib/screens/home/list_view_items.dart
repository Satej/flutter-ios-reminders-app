import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category_collection.dart';

class ListViewItems extends StatefulWidget {

  final CategoryCollection categoryCollection;
  const ListViewItems({ required this.categoryCollection });

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }

        final item = widget.categoryCollection.removeItem(oldIndex);
        setState(() {
          widget.categoryCollection.insert(newIndex, item);
        });
      },
      children: widget.categoryCollection.categories
        .map(
          (category) => ListTile(
            onTap: () {
              setState(() {
                category.toggleCheckbox();
              });
            },
            key: UniqueKey(),
            leading: Container(
              decoration: BoxDecoration(
                color: category.isChecked ? Colors.blueAccent : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: category.isChecked ? Colors.blueAccent : Colors.grey,
                ),
              ),
              child: Icon(Icons.check, color: category.isChecked ? Colors.white : Colors.transparent),
            ),
            title: Row(
              children: [
                category.icon,
                const SizedBox(width: 10),
                Text(category.name),
              ],
            ),
            trailing: const Icon(Icons.reorder),
          ),
        )
        .toList()
    );
  }
}
