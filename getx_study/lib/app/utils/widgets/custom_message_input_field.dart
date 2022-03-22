import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageErrorInput extends StatelessWidget {
  final String errorMessage;
  const MessageErrorInput({
    Key key,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: (size.width * 0.10)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          errorMessage,
          style: TextStyle(
            color: Get.theme.errorColor,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
