import 'package:flutter/material.dart';
import 'package:getx_study/app/modules/home/models/navigation_item_model.dart';

Widget itemAnimated(NavigationItem item, bool isSelected) {
  return AnimatedContainer(
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 250),
    height: 50,
    width: isSelected ? 120 : 60,
    padding: isSelected ? const EdgeInsets.only(left: 16, right: 16) : null,
    decoration: isSelected
        ? BoxDecoration(
            color: item.color,
            borderRadius: const BorderRadius.all(Radius.circular(50)))
        : null,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconTheme(
              data: IconThemeData(
                size: 24,
                color: isSelected ? Colors.white : Colors.black,
              ),
              child: item.icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: isSelected
                  ? DefaultTextStyle.merge(
                      style: const TextStyle(color: Colors.white),
                      child: item.title)
                  : Container(),
            )
          ],
        ),
      ],
    ),
  );
}
