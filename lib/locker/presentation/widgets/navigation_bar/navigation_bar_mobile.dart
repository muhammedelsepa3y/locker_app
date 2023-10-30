import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarLogo(),
          IconButton(
            icon: const Icon(Icons.menu, size: 30),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      );
  }
}
