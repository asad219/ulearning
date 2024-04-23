import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/firebase_options.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        name: "ULearning", options: DefaultFirebaseOptions.currentPlatform);

    storageService = await StorageService().init();
  }
}
