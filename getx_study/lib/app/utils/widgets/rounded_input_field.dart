import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/utils/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final controller;
  bool error;
  final String errorMessage;

  RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.error,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      error: error,
      errorMessage: errorMessage,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo vazio!';
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Get.theme.hintColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
