import 'package:flutter/material.dart';
import 'package:locker_app/core/utils/route_constants.dart';
import 'package:locker_app/locker/presentation/widgets/custom_drawer/drawer_item_header.dart';
import 'package:sizer/sizer.dart';

import 'drawer_header.dart';
import 'drawer_subitem.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 100.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CustomDrawerHeader(),
            SizedBox(height: 10.h),
            const DrawerItemHeader(
              title: 'Dashboard',
              subItems: [],
            ),
            const DrawerItemHeader(
              title: 'Users',
              subItems: [],
            ),
            DrawerItemHeader(
              title: 'Lockers',
              subItems: [
                DrawerSubItem(
                  title: 'Add Locker',
                  route: homeRoute,
                ),
                DrawerSubItem(
                  title: 'Manage Lockers',
                  route: homeRoute,
                ),
                DrawerSubItem(
                  title: 'View Lockers',
                  route: homeRoute,
                ),
              ],
            ),
            const DrawerItemHeader(
              title: 'Manage',
              subItems: [],
            ),
          ],
        ),
      ),
    );
  }
}
