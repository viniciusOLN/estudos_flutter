import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/widgets/bottom_navigation.dart';
import 'controllers/custom_bar_controller.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 65, 238, 1), //Color(0xff3f51b5),
        title: const Center(
          child: Text('Barber App'),
        ),
      ),
      body: GetBuilder<ControllerCustomBar>(
        id: 'currentPage',
        builder: (_) {
          return Container(
            child: _.currentPage(),
          );
        },
      ),
      bottomNavigationBar: BottomNavCustom(),
    );
  }
}
