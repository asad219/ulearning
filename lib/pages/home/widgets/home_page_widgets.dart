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
  return Container(
    //margin: const EdgeInsets.only(right: 13),
    decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Row(
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
        const SizedBox(
          width: 17,
        ),
        Container(
          height: 35.h,
          width: 35.w,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(color: AppColors.primaryElement)),
          child: GestureDetector(
            onTap: () {
              print("Clicked filter button");
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              child: SizedBox(
                child: Image.asset(
                  'assets/icons/options.png',
                  height: 1.h,
                  width: 1.w,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget slidersView() {
  return Container(
    width: 325.w,
    height: 160.h,
    child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        _sliderContainer(path: "assets/icons/art.png"),
        _sliderContainer(path: "assets/icons/image_1.png"),
        _sliderContainer(path: "assets/icons/image_2.png")
      ],
    ),
  );
}

Widget _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
      width: 325.w,
      height: 160.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.h)),
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))));
}
