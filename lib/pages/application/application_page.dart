import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/widgets/application_widget.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
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
                      currentIndex: state.index,
                      onTap: (value) => {
                            // setState(() {
                            //   _pageIndex = value;
                            // })
                            context.read<AppBlocs>().add(TriggerAppEvent(value))
                          },
                      elevation: 0,
                      selectedLabelStyle: const TextStyle(
                          fontFamily: 'Tenor Sans',
                          color: AppColors.primaryText,
                          fontSize: 14),
                      unselectedLabelStyle: const TextStyle(
                          fontFamily: 'Tenor Sans',
                          color: AppColors.primaryText,
                          fontSize: 14),
                      //  backgroundColor: AppColors.primarySecondaryBackground,
                      //fixedColor: AppColors.primaryText,
                      unselectedItemColor: AppColors.primaryFourElementText,
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      selectedItemColor: AppColors.primaryElement,
                      items: bottomTabs),
                ),
                body: buildPage(state.index)),
          ),
        );
      },
    );
  }
}
