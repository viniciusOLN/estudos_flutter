import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/controllers/custom_bar_controller.dart';
import 'package:getx_study/app/modules/home/widgets/animation_item_navbar.dart';

class BottomNavCustom extends StatelessWidget {
  BottomNavCustom({Key key}) : super(key: key);
  ControllerCustomBar controller = Get.put(ControllerCustomBar());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<ControllerCustomBar>(
        id: 'customBar',
        builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _.listItens.map((item) {
              var itemIndex = _.listItens.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _.updateBar(itemIndex);
                },
                child: itemAnimated(
                    item, _.selectedItem == itemIndex ? true : false),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
