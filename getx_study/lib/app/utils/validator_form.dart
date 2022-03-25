import 'package:flutter/material.dart';

class ValidatorForm {
  Map<String, TextEditingController> listControllersFields;

  ValidatorForm({
    this.listControllersFields,
  });

  bool inputEmpty() => true;

  bool inputNotEmpty() => false;

  Map<String, bool> validateForm() {
    Map<String, bool> result = {};
    for (var controller in listControllersFields.entries) {
      if (controller.value.text.isEmpty) {
        result[controller.key] = inputEmpty();
      } else {
        result[controller.key] = inputNotEmpty();
      }
    }
    return result;
  }
}
