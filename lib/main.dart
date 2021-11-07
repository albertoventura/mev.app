import 'package:flutter/material.dart';
import 'package:mev_app/Screens/home.dart';
import 'package:mev_app/Utils/Services/app_service.dart';

void main() async {
  AppService app = AppService();
  //app.startApp();
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
