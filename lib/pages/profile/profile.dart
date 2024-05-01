import 'package:flutter/material.dart';
import 'package:ulearning/common/values/colors.dart';
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
      appBar: buildAppBar("Profile Page"),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://img-c.udemycdn.com/user/200_H/27431488_2441.jpg'))),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Asad Ullah Khan",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryElement),
            ),
          ],
        ),
      )),
    );
  }
}
