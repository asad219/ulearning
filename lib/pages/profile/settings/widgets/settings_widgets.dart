import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/widgets/base_text_widget.dart';
import 'package:ulearning/common/widgets/common_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
          child: reusableText("Settings",
              fs: 16, fw: FontWeight.bold, color: AppColors.primaryText)),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? function) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: reusableText("Confirm logout"),
              content: reusableText("Confirm logut"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: reusableText("Cancel")),
                TextButton(
                    // onPressed: () {
                    //   removeUserDate();
                    // },
                    onPressed: function,
                    child: reusableText("Confirm"))
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
