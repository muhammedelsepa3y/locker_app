import 'package:flutter/material.dart';
import 'package:locker_app/locker/presentation/providers/locker_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/custom_drawer/custom_drawer.dart';
import '../../widgets/dashboard_bar/dashboard_bar.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';
import '../../widgets/sub_dashboard_bar/sub_dashboard_bar.dart';
import 'page_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LockerProvider>(context);
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
                Row(
                  children: [
                    SubDashboardBar(),
                    Expanded(child: PageContent()),


                  ],
                )


              ],
            ),
          ),
        );
      },
    );
  }
}
