import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/themes/app_theme.dart';

class CustomNotification {
  String title;
  String message;

  CustomNotification({
    this.title,
    this.message,
  });

  static showNotification(String dialogTitle, String message) {
    return showDialog(
      context: Get.context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(24, 15, 24, 30),
          title: Text(
            dialogTitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Get.theme.hintColor),
          ),
          content: Text(
            message,
            style: TextStyle(color: sucessColor),
          ),
        );
      },
    );
  }
}
