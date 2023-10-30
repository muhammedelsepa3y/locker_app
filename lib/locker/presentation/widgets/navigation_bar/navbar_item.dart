import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.push(navigationPath);
      },
      child: Text(
        title,
        style: textTheme.titleMedium,
      ),
    );
  }
}
