import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
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
          print("Email address required");
        }
        if (password.isEmpty) {
          //some warning
          print("Password required");
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //some messag here
            print("User not found");
          }
          //if not verified
          if (!credential.user!.emailVerified) {
            //some message
            print("email not verified");
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
          if (e.code == "user-not-found") {
            print("No user found for that email");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provide for that user');
          } else if (e.code == 'invalid-credential') {
            print('Invalid credential');
          }
        }
      }
    } catch (e) {}
  }
}
