import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Profile(),
  ];
  return _widget[index];
}

var bottomTabs = [
  const BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.home),
      activeIcon: Icon(
        Icons.home,
        color: AppColors.primaryElement,
      )),
  BottomNavigationBarItem(
      label: "Search",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(Icons.search),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.search,
          color: AppColors.primaryElement,
        ),
      )),
  const BottomNavigationBarItem(
    label: "Course",
    icon: Icon(Icons.play_circle_outline_rounded),
    activeIcon: Icon(Icons.play_circle_outline_rounded,
        color: AppColors.primaryElement),
  ),
  const BottomNavigationBarItem(
      label: "Chat",
      icon: Icon(Icons.chat_bubble),
      activeIcon: Icon(
        Icons.chat_bubble,
        color: AppColors.primaryElement,
      )),
  const BottomNavigationBarItem(
      label: "Profile",
      icon: Icon(Icons.person),
      activeIcon: Icon(
        Icons.person,
        color: AppColors.primaryElement,
      )),
];
