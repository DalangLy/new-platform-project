import 'dart:io';
import 'package:flutter/material.dart';
import 'app_export.dart';

void main() {
  injector();
  runApp(const RootMaterialApp());

  //(development only) to allow using localhost uri for api
  HttpOverrides.global = MyHttpOverrides();
}



//******************* Development Only **********************
class MyHttpOverrides extends HttpOverrides {
  //to allow using localhost uri for api (development only)
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}