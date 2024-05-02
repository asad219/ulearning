import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}
