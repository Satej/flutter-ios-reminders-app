import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/widgets/category_icon.dart';
import 'category.dart';

class CategoryCollection {
  final List<Category> categories = [
    Category(
        id: 'today',
        name: 'Today',
        icon: const CategoryIcon(
          bgColor: CupertinoColors.systemBlue,
          iconData: CupertinoIcons.calendar_today,
        )
    ),
    Category(
      id: 'scheduled',
      name: 'Scheduled',
      icon: const CategoryIcon(
        bgColor: CupertinoColors.systemRed,
        iconData: CupertinoIcons.calendar,
      ),
    ),
    Category(
      id: 'all',
      name: 'All',
      icon: const CategoryIcon(
        bgColor: CupertinoColors.systemGrey,
        iconData: Icons.inbox_rounded,
      ),
    ),
    Category(
      id: 'flagged',
      name: 'Flagged',
      icon: const CategoryIcon(
        bgColor: CupertinoColors.activeOrange,
        iconData: CupertinoIcons.flag_fill,
      ),
    ),
  ];
}