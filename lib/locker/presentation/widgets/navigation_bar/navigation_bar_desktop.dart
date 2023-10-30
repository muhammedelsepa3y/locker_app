import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/route_constants.dart';
import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
   NavigationBarDesktop({super.key});
  TextEditingController searchController = TextEditingController();
  List<NavBarItem> navBarItems = [
    NavBarItem('Topic 1', "topic 1"),
    NavBarItem('Topic 2', "topic 2"),
    NavBarItem('Topic 3', "topic 3"),
    NavBarItem('Topic 4', "topic 4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 2.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 20.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const NavbarLogo(),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Container(
                height: 5.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder:(context,index)=> navBarItems[index],
                    separatorBuilder: (context,index)=>SizedBox(width: 5.w,),
                    itemCount: navBarItems.length,
                ),
              ),
              SizedBox(
                width: 17.w,
                height: 6.h,


                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                    isCollapsed: true,

                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(5),
                    ),

                  ),

                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
