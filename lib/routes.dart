import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'package:listat/LogIn.dart';
import 'browseList.dart';
import 'database_test.dart';
import 'navbar.dart';
import 'profile.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const LoginPage()),
    GetPage(name: browse, page: () => BrowseList()),
    GetPage(name: lists, page: () => DatabaseTest()),
    // GetPage(name: profile, page: ()=> Profile())
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getbrowse() => browse;
  static getlists() => lists;
  static getprofile() => profile;

  static String navbar = '/';
  static String home = '/home';
  static String browse = '/browse';
  static String lists = '/lists';
  static String profile = '/profile';
}
