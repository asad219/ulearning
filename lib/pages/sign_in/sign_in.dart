import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child:
                            reusableText("Or use your email account to login")),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(top: 66.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(
                              height: 5.h,
                            ),
                            reusableTextField(
                                "Enter your email address", "email", "user"),
                            reusableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            reusableTextField(
                                "Enter your password", "password", "lock"),
                            SizedBox(
                              height: 5.h,
                            ),
                            forgotPassword("Forgot password?"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildLoginAndSignUpButton("Log In", "login"),
                            buildLoginAndSignUpButton("Register", "register")
                          ]),
                    )
                  ]),
            )),
      ),
    );
  }
}
