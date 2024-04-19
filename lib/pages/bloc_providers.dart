import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        // BlocProvider(lazy: false, create: (context) => AppBlocs()),
        BlocProvider(lazy: false, create: (context) => SignInBloc()),
        BlocProvider(lazy: false, create: ((context) => RegisterBlocs())),
      ];
}
