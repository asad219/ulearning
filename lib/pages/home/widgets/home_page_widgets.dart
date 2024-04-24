import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/widgets/common_widgets.dart';

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
    children: [
      Container(
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(width: 1, color: AppColors.primaryFourElementText)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Icon(Icons.search)),
            Container(
              width: 240.w,
              height: 40.w,
              child: TextField(
                // onChanged: (value) => func!(value),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "search your course",
                    hintStyle:
                        TextStyle(color: AppColors.primarySecondaryElementText),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    )),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement)),
        child: GestureDetector(
          child: Image.asset(
            'assets/icons/options.png',
            height: 1.h,
            width: 1.w,
          ),
        ),
      )
    ],
  );
}
