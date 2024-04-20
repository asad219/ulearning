import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7.w, right: 7.w),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Text(
                "Hello",
                style: TextStyle(fontSize: 14.sp),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
