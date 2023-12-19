import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'browseList.dart';
import 'database_test.dart';
import 'navbar.dart';


class NavBarController extends GetxController{
  var tabIndex = 0;
  void changeTabIndex(int index){
    tabIndex=index;
    update();
  }
}