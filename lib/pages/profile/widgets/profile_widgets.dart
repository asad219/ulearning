import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/routes.dart';

import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/widgets/base_text_widget.dart';

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
          reusableText(title),
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

//profile Icon and Edit Widget
Widget profileIconAndEditWidget() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: const EdgeInsets.only(right: 20, bottom: 20),
    margin: const EdgeInsets.only(top: 40),
    width: 200,
    height: 200,
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(
                'https://img-c.udemycdn.com/user/200_H/27431488_2441.jpg'))),
    child: Image(
      height: 25.h,
      width: 25.w,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

var iconsInfo = <String, IconData>{
  "Settings": Icons.settings,
  "Pament Details": Icons.payment,
  "Acheivement": Icons.card_giftcard,
  "Love": Icons.favorite,
  "Learning Reminders": Icons.notifications
};
//profile setting list view
Widget buildListView(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: AppColors.primaryElementText,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        ...List.generate(
          iconsInfo.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE);
            },
            child: _listView(iconsInfo.keys.elementAt(index),
                iconsInfo.values.elementAt(index)),
          ),
        )
      ],
    ),
  );
}

Widget _listView(String title, IconData iconData) {
  return Container(
    padding: EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(right: 20),
          width: 35.w,
          height: 35.h,
          child: Icon(
            size: 25,
            iconData,
            color: AppColors.primaryElementText,
          ),
        ),
        Container(
          child: reusableText(title, fs: 14, fw: FontWeight.normal),
        )
      ],
    ),
  );
}
