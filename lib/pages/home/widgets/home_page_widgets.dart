import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

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

Widget slidersView(BuildContext context, HomePageStates state) {
  return Container(
    child: Column(
      children: [
        Container(
          width: 325.w,
          height: 160.h,
          child: PageView(
            onPageChanged: (value) {
              context.read<HomePageBlocs>().add(HomePageDots(value));
            },
            scrollDirection: Axis.horizontal,
            children: [
              _sliderContainer(path: "assets/icons/art.png"),
              _sliderContainer(path: "assets/icons/image_1.png"),
              _sliderContainer(path: "assets/icons/image_2.png")
            ],
          ),
        ),
        Container(
          child: DotsIndicator(
            dotsCount: 3,
            position: state.index,
            decorator: DotsDecorator(
                color: AppColors.primaryThreeElementText,
                activeColor: AppColors.primaryElement,
                size: const Size.square(5.0),
                activeSize: const Size(17.0, 5.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
        )
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

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _resuableText("Choose your course",
                fs: 16, fw: FontWeight.bold, color: AppColors.primaryText),
            GestureDetector(
              onTap: () {
                print("Clicked on See all");
              },
              child: _resuableText("See all",
                  fs: 14,
                  fw: FontWeight.normal,
                  color: AppColors.primaryElement),
            ),
          ],
        ),
      ),
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _resuableMenuText("All"),
            _resuableMenuText("Popular",
                textColor: AppColors.primaryFourElementText,
                backgroundColor: AppColors.primaryElementText),
            _resuableMenuText("Newest",
                textColor: AppColors.primaryFourElementText,
                backgroundColor: AppColors.primaryElementText)
          ],
        ),
      ),
    ],
  );
}

Widget _resuableText(String text,
    {int fs = 16,
    FontWeight fw = FontWeight.bold,
    Color color = AppColors.primaryText}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fs.sp, fontWeight: fw),
  );
}

Widget _resuableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
      margin: EdgeInsets.only(right: 20.w),
      padding: EdgeInsets.only(top: 5.h, right: 15.w, bottom: 5.h, left: 15.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
      ),
      child: _resuableText(menuText,
          fs: 11, fw: FontWeight.normal, color: textColor));
}

Widget courseGrid() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/icons/image_2.png"),
            fit: BoxFit.fill,
            alignment: Alignment.topLeft)),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Best ccourse fo IT",
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp),
            ),
            Text(
              "Flutter best course",
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp),
            ),
          ]),
    ),
  );
}
