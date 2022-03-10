import 'package:getx_study/app/modules/initial/initial_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InitialPage extends GetView<InitialController> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Obx(() => Text("${controller.nome}")),
          ),
          IconButton(
            onPressed: () {
              controller.atualizar();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
