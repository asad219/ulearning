import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning/common/routes/routes.dart';

import 'package:ulearning/common/values/colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD3nkTgehwADkeF13QhpgVOwkk6Jlnwa4E",
          appId: '790597821762:android:6ca4865b4e7cf35c9314db',
          messagingSenderId: '790597821762',
          projectId: 'ulearing-app-eb4b2'));
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

            //home: const Welcome(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
            //initialRoute: "/",
            // routes: {
            //   //"myHomePage": (context) => const MyHomePage(),
            //   "signIn": (context) => const SignIn(),
            //   "register": (context) => const Register()
            // },
          ),
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void _incrementCounter() {
//     BlocProvider.of<AppBlocs>(context).add(Increment());
//   }

//   void _decrementCounter() {
//     BlocProvider.of<AppBlocs>(context).add(Decrement());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(child: BlocBuilder<AppBlocs, AppStates>(
//         builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times: ${BlocProvider.of<AppBlocs>(context).state.name}',
//               ),
//               Text(
//                 '${BlocProvider.of<AppBlocs>(context).state.counter}',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         },
//       )),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             //onPressed: () => BlocProvider.of<AppBlocs>(context).add(Decrement()), //_decrementCounter,
//             onPressed: _decrementCounter,
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//           FloatingActionButton(
//             //onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()), //_incrementCounter,
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("This is Stateless"),
//       ),
//       body: Center(child: BlocBuilder<AppBlocs, AppStates>(
//         builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times: ${BlocProvider.of<AppBlocs>(context).state.name}',
//               ),
//               Text(
//                 '${BlocProvider.of<AppBlocs>(context).state.counter}',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         },
//       )),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: "heroTag1",
//             onPressed: () => BlocProvider.of<AppBlocs>(context)
//                 .add(Decrement()), //_decrementCounter,
//             //onPressed: _decrementCounter,
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//           FloatingActionButton(
//             heroTag: "heroTag2",
//             onPressed: () => BlocProvider.of<AppBlocs>(context)
//                 .add(Increment()), //_incrementCounter,
//             //onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
