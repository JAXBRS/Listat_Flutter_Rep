import 'package:flutter/material.dart';
import 'package:listat/createList.dart';
import 'LogIn.dart';
import 'database_test.dart';

void main() {
  runApp(MyApp());
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
      routes: {"createlist": (context) => CreateList()},
    );
  }
}
