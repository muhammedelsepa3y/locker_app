import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'navigation_bar_desktop.dart';
import 'navigation_bar_mobile.dart';

class NavigationBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScreenTypeLayout(
        mobile: NavigationBarMobile(),
        tablet: NavigationBarDesktop(),
      ),
    );
  }
}
