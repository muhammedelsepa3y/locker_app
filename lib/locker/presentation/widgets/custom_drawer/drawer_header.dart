import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        'IMBoX',
        style: textTheme.headlineLarge,
      ),
    );
  }
}
