import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/toast_messages.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (userName.isEmpty) {
      ToastMessages(msg: "Username can't be empty");
    }
    if (email.isEmpty) {
      ToastMessages(msg: "Email can't be empty");
    }
    if (password.isEmpty) {
      ToastMessages(msg: "Password can't be empty");
    }
    if (rePassword.isEmpty) {
      ToastMessages(msg: "Confirm can't be empty");
    }
    if (rePassword != password) {
      ToastMessages(msg: "Password mismatch");
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
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        ToastMessages(msg: "Activate your account, please check your email");
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'weak-password') {
        ToastMessages(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        ToastMessages(msg: "Email is already in use");
      } else if (e.code == 'invalid-email') {
        ToastMessages(msg: "Email is invalid");
      }
    }
  }
}
