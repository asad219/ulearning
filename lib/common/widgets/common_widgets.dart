import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        //heigh defines thickness of the line
        height: 1.0,
      ),
    ),
  );
}

//We need context for accessing BLoC
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Padding(
      padding: const EdgeInsets.only(left: 70.0, right: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _resuableIcons("google"),
          _resuableIcons("apple"),
          _resuableIcons("facebook"),
        ],
      ),
    ),
  );
}

Widget _resuableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.9),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget reusableTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: const EdgeInsets.only(bottom: 5),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 40.h,
          margin: const EdgeInsets.only(top: 7),
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword(String text) {
  return Container(
    child: GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLoginAndSignUpButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: buttonType == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: buttonType == "login"
                    ? Colors.transparent
                    : AppColors.primaryFourElementText),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: Colors.grey.withOpacity(0.5))
            ]),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        )),
      ));
}
