import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/themes/app_theme.dart';
import 'package:intl/intl.dart';

class CardService extends StatelessWidget {
  String categoryService;
  String titleService;
  int priceService;
  String dateService;

  CardService({
    Key key,
    this.categoryService,
    this.titleService,
    this.priceService,
    this.dateService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.build,
                  size: 14,
                ),
              ),
              Text(
                categoryService.toUpperCase(),
                style: TextThemeDefault.cardTextCategory,
              ),
            ],
          ),
          SizedBox(height: Get.size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleService,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextThemeDefault.cardTextTitle,
              ),
              Icon(Icons.keyboard_arrow_right, size: 40),
            ],
          ),
          SizedBox(height: Get.size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Horário Agendado",
                    style: TextThemeDefault.cardTextHour,
                  ),
                  SizedBox(height: Get.size.height * 0.006),
                  Row(
                    children: [
                      Icon(Icons.timer, size: 12),
                      SizedBox(
                        width: Get.size.width * 0.01,
                      ),
                      Text(
                        "${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(dateService))}",
                        style: TextThemeDefault.baselineTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Valor do serviço",
                    style: TextThemeDefault.cardTextCostService,
                  ),
                  SizedBox(height: Get.size.height * 0.001),
                  RichText(
                    text: TextSpan(
                      text: 'R\$ ',
                      style: TextThemeDefault.cardTextAcronymService,
                      children: [
                        TextSpan(
                          text: priceService.toString(),
                          style: TextThemeDefault.cardTextValueService,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
