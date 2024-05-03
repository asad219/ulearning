import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

Widget reusableText(String text,
    {int fs = 16,
    FontWeight fw = FontWeight.bold,
    Color color = AppColors.primaryText}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fs.sp,
      fontWeight: fw,
      fontFamily: "Tenor Sans",
    ),
  );
}
