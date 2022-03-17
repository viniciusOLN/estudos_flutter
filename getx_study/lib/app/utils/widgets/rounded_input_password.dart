import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/utils/widgets/text_field_container.dart';

// ignore: must_be_immutable
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final controller;
  bool showPassword;
  Function changeShowPassword;
  RoundedPasswordField({
    Key key,
    this.controller,
    this.onChanged,
    this.showPassword = false,
    this.changeShowPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo requerido.';
          }
          if (value.length <= 4) {
            return 'Campo requer mínimo 5 caracteres.';
          }
          return null;
        },
        controller: controller,
        obscureText: !showPassword,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: Get.theme.hintColor,
          ),
          suffixIcon: IconButton(
            icon: showPassword
                ? Icon(
                    Icons.visibility_off,
                    color: Get.theme.hintColor,
                  )
                : Icon(
                    Icons.visibility,
                    color: Get.theme.hintColor,
                  ),
            onPressed: changeShowPassword,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}