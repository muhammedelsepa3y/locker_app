import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/locker_provider.dart';
import '../dashboard_bar/dashboard_item.dart';
import '../navigation_bar/navbar_item.dart';

class SubDashboardBar extends StatelessWidget {
  const SubDashboardBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LockerProvider>(context);
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all( 2.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),

      height: 58.h,
      width: 20.w,
      child:ListView.separated(

          shrinkWrap: true,
        itemBuilder: (context,index)=> DashboardItem(title: provider.getSubPages()[index]),

          separatorBuilder: (context,index)=>SizedBox(height: 2.h,),
          itemCount: provider.getSubPages().length,

      ),
    );
  }
}
