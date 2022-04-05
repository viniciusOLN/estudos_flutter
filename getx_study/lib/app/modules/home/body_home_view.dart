import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/data/model/schedule_model.dart';
import 'package:getx_study/app/modules/home/home_controller.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'listSchedules',
      builder: (_) {
        return ListView.builder(
          itemCount: _.listSchedules.length,
          itemBuilder: (context, indice) {
            Schedule listItemSchedule = _.listSchedules[indice];
            return ListTile(
              title: Text(listItemSchedule.service.name),
              subtitle: Text(listItemSchedule.schedulingDate),
            );
          },
        );
      },
    );
  }
}
