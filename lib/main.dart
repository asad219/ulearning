import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning/common/routes/routes.dart';

import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/firebase_options.dart';
import 'package:ulearning/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "ULearning", options: DefaultFirebaseOptions.currentPlatform);
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        //providers: AppBlocProviders.allProviders,
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText)),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            onGenerateRoute: AppPages.GenerateRouteSettings,
          ),
        ));
  }
}
