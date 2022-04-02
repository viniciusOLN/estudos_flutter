import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/body_home_view.dart';
import 'package:getx_study/app/modules/home/models/navigation_item_model.dart';
import 'package:getx_study/app/modules/profile/profile_view.dart';
import 'package:getx_study/app/modules/search/search_view.dart';
import '../home_controller.dart';

class ControllerCustomBar extends GetxController {
  final controllerHome = Get.put(HomeController());

  List<NavigationItem> listItens = [
    NavigationItem(
      icon: const Icon(Icons.home),
      title: const Text('Home'),
      color: Colors.deepPurpleAccent,
      page: const HomePageBody(),
    ),
    NavigationItem(
      icon: const Icon(Icons.search),
      title: const Text('Procurar'),
      color: Colors.pinkAccent,
      page: const Searchpage(),
    ),
    NavigationItem(
      icon: const Icon(Icons.person),
      title: const Text('Profile'),
      color: Colors.cyan[800],
      page: const ProfilePage(),
    ),
  ];

  int selectedItem = 0;

  updateBar(itemIndex) {
    selectedItem = itemIndex;
    update(['customBar']);
    update(['currentPage']);
  }

  Widget currentPage() {
    return listItens[selectedItem].page;
  }
}
