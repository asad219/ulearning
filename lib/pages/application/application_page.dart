import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 58.h,
            width: 375.w,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20.h),
              //     topRight: Radius.circular(20.h)),
              border: Border(
                  top: BorderSide(
                color: Colors.grey.withOpacity(.3),
                width: 1.0,
              )),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                ),
              ],
            ),
            child: BottomNavigationBar(
                currentIndex: _pageIndex,
                onTap: (value) => {
                      setState(() {
                        _pageIndex = value;
                      })
                    },
                elevation: 0,
                unselectedLabelStyle:
                    const TextStyle(color: AppColors.primaryText, fontSize: 14),
                //  backgroundColor: AppColors.primarySecondaryBackground,
                //fixedColor: AppColors.primaryText,
                unselectedItemColor: AppColors.primaryFourElementText,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: AppColors.primaryElement,
                items: [
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
                ]),
          ),
          body: buildPage(_pageIndex)),
    );
  }
}
