import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(title),
          SizedBox(
            width: 18.w,
            height: 18.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          )
        ],
      ),
    ),
  );
}
