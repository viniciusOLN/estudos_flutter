import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ValidatorForm extends GetxController {
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

  bool resultValidationForm(Map valuesFromTextField) {
    return !valuesFromTextField.values.contains(true) ? true : false;
  }
}
