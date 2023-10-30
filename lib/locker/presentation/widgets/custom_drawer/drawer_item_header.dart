import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_subitem.dart';

class DrawerItemHeader extends StatelessWidget {
  final String title;
  final List<DrawerSubItem> subItems;
  const DrawerItemHeader({required this.title, required this.subItems});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ExpansionTile(
      title: Text(
        title,
        style: textTheme.bodyLarge,
      ),
      children: [
        for (final subItem in subItems)
          ListTile(
            title: Text(
              subItem.title,
              style: textTheme.bodyMedium,
            ),
            onTap: () {
              context.pushReplacement(subItem.route);
            },
          ),
      ],
    );
  }
}
