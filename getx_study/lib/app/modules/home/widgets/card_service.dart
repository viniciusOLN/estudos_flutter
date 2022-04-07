import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        color: Color.fromRGBO(239, 239, 249, 1),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.build,
                  size: 14,
                ),
              ),
              Text(
                categoryService.toUpperCase(),
                style: TextStyle(
                  color: Color.fromRGBO(64, 53, 53, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Inter',
                ),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Inter',
                ),
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
                    style: TextStyle(
                      color: Color.fromRGBO(56, 55, 55, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
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
                        style: TextStyle(
                          fontFamily: 'Inter',
                        ),
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
                    style: TextStyle(
                      color: Color.fromRGBO(56, 55, 55, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: Get.size.height * 0.001),
                  RichText(
                    text: TextSpan(
                      text: 'R\$ ',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 3, 3, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(
                          text: priceService.toString(),
                          style: TextStyle(
                            color: Color.fromRGBO(56, 55, 55, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Inter',
                          ),
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
