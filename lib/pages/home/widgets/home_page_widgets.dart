import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      padding: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageWelcomeText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
      margin: EdgeInsets.only(top: top.h),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.bold, color: color),
      ));
}

Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.w,
        color: Colors.red,
      ),
      Container(child: const Icon(Icons.search))
    ],
  );
}
