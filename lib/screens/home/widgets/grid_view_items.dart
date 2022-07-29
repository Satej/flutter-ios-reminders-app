import 'package:flutter/material.dart';

import '../../../models/category/category.dart';
import '../../../models/category/category_collection.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 16 / 9,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: categories
          .map(
            (category) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF1A191D),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    category.icon,
                    const Text('0'),
                  ],
                ),
                Text(category.name),
              ],
            ),
          ),
        ),
      ).toList(),
    );
  }
}