import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BLocProvider.of<SignInBloc>(context).state
        final state = context.read()<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //some warning
        }
        if (password.isEmpty) {
          //some warning
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //some messag here
          }
          //if not verified
          if (!credential.user!.emailVerified) {
            //some message
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
          } else {
            //we have error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
