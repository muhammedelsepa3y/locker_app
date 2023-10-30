import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/locker_provider.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  DashboardItem({required this.title});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider=Provider.of<LockerProvider>(context);
    return InkWell(
      hoverColor: Colors.transparent,

      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        provider.selectedPage=title;
      },
      child: Text(
        title,
        style: (provider.selectedMainPage==title || provider.selectedSubPageText==title)?textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w800,
        ):textTheme.titleMedium,
      ),
    );
  }
}
