import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning/common/apis/user_api.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/common/widgets/toast_messages.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BLocProvider.of<SignInBloc>(context).state
        //final state = BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //some warning
          ToastMessages(
              msg: "Email address required",
              backgroundColor: const Color(0xFFFF1800),
              textColor: const Color(0xFFFFFFFF));
          return;
        }
        if (password.isEmpty) {
          //some warning

          ToastMessages(
              msg: "Password required",
              backgroundColor: const Color(0xFFFF1800),
              textColor: const Color(0xFFFFFFFF));
          return;
        }

        try {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          Navigator.of(context).pop();
          if (credential.user == null) {
            //some messag here

            ToastMessages(
                msg: "User not found",
                backgroundColor: const Color(0xFFFF1800),
                textColor: const Color(0xFFFFFFFF));
            return;
          }
          //if not verified
          if (!credential.user!.emailVerified) {
            //some message

            ToastMessages(
                msg: 'Email not verified',
                backgroundColor: const Color(0xFFFF1800));
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName!;
            String? email = user.email!;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //type 1 means email authentication
            loginRequestEntity.type = 1;
            asyncPostAllData(loginRequestEntity);

            // await Global.storageService
            //     .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "1234567890");
            // //we got verified user from firebase
            // // ToastMessages(msg: 'User found');
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          print(e);
          Navigator.of(context).pop();
          if (e.code == "user-not-found") {
            ToastMessages(
                msg: "No user found for that email",
                backgroundColor: const Color(0xFFFF1800),
                textColor: const Color(0xFFFFFFFF));
          } else if (e.code == 'wrong-password') {
            ToastMessages(
                msg: "Wrong password provide for that user",
                backgroundColor: const Color(0xFFFF1800),
                textColor: const Color(0xFFFFFFFF));
          } else if (e.code == 'invalid-credential') {
            ToastMessages(
                msg: "Invalid credential",
                backgroundColor: const Color(0xFFFF1800),
                textColor: const Color(0xFFFFFFFF));
          }
          return;
        }
      }
    } catch (e) {}
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserApi.login(params: loginRequestEntity);
  }
}
