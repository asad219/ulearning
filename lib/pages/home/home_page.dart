import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
              width: 325.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homePageWelcomeText("Hello",
                      color: AppColors.primaryThreeElementText, top: 20),
                  homePageWelcomeText("Asad Khan", top: 5),
                  SizedBox(
                    height: 20.h,
                  ),
                  searchView(),
                  SizedBox(
                    height: 20.h,
                  ),
                  slidersView(context, state),
                  SizedBox(
                    height: 20.h,
                  ),
                  menuView()
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
