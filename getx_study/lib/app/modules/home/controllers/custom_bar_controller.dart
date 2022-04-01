import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/models/navigation_item_model.dart';

class ControllerCustomBar extends GetxController {
  List<NavigationItem> listItens = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.search), Text('Procurar'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person), Text('Profile'), Colors.cyan[800]),
  ];

  int selectedItem = 0;

  updateBar(itemIndex) {
    selectedItem = itemIndex;
    update(['customBar']);
  }
}
