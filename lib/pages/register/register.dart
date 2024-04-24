import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/widgets/common_widgets.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';
import 'package:ulearning/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                appBar: buildAppBar("Sign Up"),
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: reusableText(
                                "Enter your details below and free sign up")),
                        Container(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          margin: EdgeInsets.only(top: 30.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText("Name"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                reusableTextField(
                                    "Enter your full name", "name", "user",
                                    (value) {
                                  context
                                      .read<RegisterBlocs>()
                                      .add(UserNameEvent(value));
                                }),
                                reusableText("Email"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                reusableTextField("Enter your email address",
                                    "email", "email", (value) {
                                  context
                                      .read<RegisterBlocs>()
                                      .add(EmailEvent(value));
                                }),
                                reusableText("Password"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                reusableTextField(
                                    "Enter your password", "password", "lock",
                                    (value) {
                                  context
                                      .read<RegisterBlocs>()
                                      .add(PasswordEvent(value));
                                }),
                                reusableText("Confirm Password"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                reusableTextField("Re-enter your password",
                                    "password", "lock", (value) {
                                  context
                                      .read<RegisterBlocs>()
                                      .add(RePasswordEvent(value));
                                }),
                                SizedBox(
                                  height: 5.h,
                                ),
                                reusableText(
                                    "By creating an account you have to agree with our term & condition."),
                                SizedBox(
                                  height: 5.h,
                                ),
                                buildLoginAndSignUpButton("Sign Up", "login",
                                    () {
                                  RegisterController(context: context)
                                      .handleEmailRegister();
                                })
                              ]),
                        )
                      ]),
                )),
          ),
        );
      },
    );
  }
}
