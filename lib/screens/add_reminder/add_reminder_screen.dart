import 'package:flutter/material.dart';

import '../../common/widgets/category_icon.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Add',
              style: TextStyle(
                //color: _listName.isNotEmpty ? Colors.blueAccent : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Notes',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () {},
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today,
                      ),
                      SizedBox(width: 10,),
                      Text('New List'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  tileColor: Theme.of(context).cardColor,
                  onTap: () {},
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                        bgColor: Colors.blueAccent,
                        iconData: Icons.calendar_today,
                      ),
                      SizedBox(width: 10,),
                      Text('Scheduled'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
