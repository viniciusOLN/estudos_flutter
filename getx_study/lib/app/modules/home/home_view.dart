import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(title: Text("counter")),
        body: Center(
          child: Obx(() => Text("${controller.count}")),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: controller.increment,
        ),
      );
}
