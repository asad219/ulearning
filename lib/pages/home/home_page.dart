import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/home_controller.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.initt();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            width: 325.w,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: homePageWelcomeText("Hello",
                    color: AppColors.primaryThreeElementText, top: 20),
              ),
              // SliverToBoxAdapter(
              //     child: homePageWelcomeText(_homeController.userProfile.name!,
              //         top: 5)),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: searchView()),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: slidersView(context, state)),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: menuView()),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(childCount: 4,
                        (context, index) {
                      return GestureDetector(onTap: () {}, child: courseGrid());
                    }),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.6,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10)),
              )
            ]),
          );
        },
      ),
    ));
  }
}
