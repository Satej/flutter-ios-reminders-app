import 'package:flutter/material.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
            label: const Text('New Reminder'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddListScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: const Text('Add List'),
          ),
        ],
      ),
    );
  }
}
