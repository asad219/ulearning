import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm logout"),
                              content: Text("Confirm logut"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                                TextButton(
                                    onPressed: () {
                                      Global.storageService.remove(
                                          AppConstants.STORAGE_USER_TOKEN_KEY);
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              AppRoutes.SIGN_IN,
                                              (route) => false);
                                    },
                                    child: const Text("Confirm"))
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
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
