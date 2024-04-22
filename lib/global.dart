import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // (
    //     options: const FirebaseOptions(
    //         apiKey: "AIzaSyD3nkTgehwADkeF13QhpgVOwkk6Jlnwa4E",
    //         appId: '790597821762:android:6ca4865b4e7cf35c9314db',
    //         messagingSenderId: '790597821762',
    //         projectId: 'ulearing-app-eb4b2'));

    storageService = await StorageService().init();
  }
}
