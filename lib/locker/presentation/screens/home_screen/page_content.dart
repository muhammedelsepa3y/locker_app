import 'package:flutter/material.dart';
import 'package:locker_app/locker/presentation/providers/locker_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LockerProvider>(context);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all( 2.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 58.h,
      child: provider.selectedSubPage,
    );
  }
}
