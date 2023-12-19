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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {"createlist": (context) => CreateList()},
    );
  }
}
