import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/widgets/base_text_widget.dart';
import 'package:ulearning/pages/profile/widgets/profile_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryFourElementText.withOpacity(.2),
      appBar: buildAppBar("Profile Page"),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileIconAndEditWidget(),
            const SizedBox(
              height: 20,
            ),
            reusableText("Asad Khan"),
            buildListView(context)
          ],
        ),
      )),
    );
  }
}
