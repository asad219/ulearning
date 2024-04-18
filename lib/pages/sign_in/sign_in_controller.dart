import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/toast_messages.dart';
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
        }
        if (password.isEmpty) {
          //some warning

          ToastMessages(
              msg: "Password required",
              backgroundColor: const Color(0xFFFF1800),
              textColor: const Color(0xFFFFFFFF));
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
          }
          //if not verified
          if (!credential.user!.emailVerified) {
            //some message

            ToastMessages(
                msg: 'Email not verified',
                backgroundColor: const Color(0xFFFF1800));
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            ToastMessages(msg: 'User found');
          } else {
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
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
        }
      }
    } catch (e) {}
  }
}
