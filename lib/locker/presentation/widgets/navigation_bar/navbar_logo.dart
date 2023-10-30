import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "IMBoX LMS",
        style: textTheme.headlineMedium,
      ),
    );
  }
}
