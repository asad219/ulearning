import 'package:flutter/material.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/global.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem userProfile = Global.storageService.getUserProfile();
  void initt() {
    print("...home controller init method");
  }
}
