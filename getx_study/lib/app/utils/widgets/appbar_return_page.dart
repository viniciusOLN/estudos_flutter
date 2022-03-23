import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarReturnPage {
  static PreferredSizeWidget AppbarReturn = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Get.theme.hintColor,
    ),
    title: Text(
      'Voltar',
      style: TextStyle(
        color: Get.theme.hintColor,
      ),
    ),
  );
}
