import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidatorInputDialog extends StatelessWidget {
  String text = "";
  ValidatorInputDialog({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      height: 100,
      child: Text(text),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}
