import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/data/model/schedule_model.dart';
import 'package:getx_study/app/modules/home/home_controller.dart';

import 'widgets/card_service.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Serviços Marcados'),
          ),
        ),
        GetBuilder<HomeController>(
          id: 'listSchedules',
          builder: (_) {
            return Expanded(
              child: ListView.builder(
                itemCount: _.listSchedules.length,
                itemBuilder: (context, indice) {
                  Schedule listItemSchedule = _.listSchedules[indice];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CardService(
                      categoryService: listItemSchedule.service.name,
                      titleService: listItemSchedule.service.name,
                      priceService: listItemSchedule.service.cost,
                      dateService: listItemSchedule.schedulingDate,
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
