import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listat/browseList.dart';
import 'package:listat/controller.dart';
import 'package:listat/createList.dart';
import 'LogIn.dart';
import 'database_test.dart';
import 'package:listat/myList.dart';
import 'routes.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getnavbar(),
      getPages: AppPage.routes));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
