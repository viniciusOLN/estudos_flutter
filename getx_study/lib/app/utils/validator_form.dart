import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ValidatorForm extends GetxController {
  Map<String, TextEditingController> listControllersFields;

  ValidatorForm({
    this.listControllersFields,
  });

  bool inputEmpty() => true;

  bool inputNotEmpty() => false;

//arrumar bug de q ele passa quando o user tem algo e a senha nao
// na verdade eu tenho que pegar os valores booleanos(de result) e nao uma variavel so ali no fim

//pesquisar como dar update em um outro local de outra classe com getx
  Map<String, bool> validateForm() {
    Map<String, bool> result = {};
    bool returnValue = false;
    for (var controller in listControllersFields.entries) {
      print(controller.key);
      if (controller.value.text.isEmpty) {
        result[controller.key] = inputEmpty();
      } else {
        result[controller.key] = inputNotEmpty();
      }
    }
    return result;
  }
}
