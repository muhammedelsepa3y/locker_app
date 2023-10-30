import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/custom_drawer/custom_drawer.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? const CustomDrawer()
              : null,
          body: CenteredView(
            child: Column(
              children: [
                NavigationBarr(),
                DashboardBar(),


              ],
            ),
          ),
        );
      },
    );
  }
}
