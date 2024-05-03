import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/widgets/base_text_widget.dart';
import 'package:ulearning/common/widgets/common_widgets.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning/pages/sign_in/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar("Login"),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(
                          child: reusableText(
                              "Or use your email account to login")),
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
                                  "Enter your email address", "email", "email",
                                  (value) {
                                context
                                    .read<SignInBloc>()
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
                                    .read<SignInBloc>()
                                    .add(PasswordEvent(value));
                              }),
                              SizedBox(
                                height: 5.h,
                              ),
                              forgotPassword("Forgot password?"),
                              SizedBox(
                                height: 5.h,
                              ),
                              buildLoginAndSignUpButton("Sign In", "login", () {
                                SignInController(context: context)
                                    .handleSignIn("email");
                              }),
                              buildLoginAndSignUpButton("Sign Up", "signup",
                                  () {
                                Navigator.of(context).pushNamed("/register");
                              })
                            ]),
                      )
                    ]),
              )),
        ),
      );
    });
  }
}
