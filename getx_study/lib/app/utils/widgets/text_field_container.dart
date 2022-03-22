import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_message_input_field.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  bool error;
  final String errorMessage;
  TextFieldContainer({
    Key key,
    this.child,
    this.error,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Get.theme.highlightColor,
            borderRadius: BorderRadius.circular(29),
            border: !error
                ? Border.all(color: Colors.transparent, width: 0)
                : Border.all(
                    color: Get.theme.errorColor,
                  ),
          ),
          child: child,
        ),
        !error
            ? Container()
            : MessageErrorInput(
                errorMessage: errorMessage,
              ),
      ],
    );
  }
}
