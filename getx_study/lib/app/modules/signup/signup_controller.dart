import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/utils/validator_form.dart';
import 'package:getx_study/app/utils/widgets/loading.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool confirmPasswordEmpty = false;
  bool loadingRegister = false;
  String errorMessageInputEmpty = "Campo vazio!";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ValidatorForm validate;

  bool statePassword() {
    update(['inputPassword']);
    showPassword = !showPassword;
  }

  bool stateConfirmPassword() {
    update(['inputConfirmPassword']);
    showConfirmPassword = !showConfirmPassword;
  }

  void loadRegister() {
    update(['loadingButton']);
    loadingRegister = !loadingRegister;
  }

  bool validateForm() {
    validate = ValidatorForm(
      listControllersFields: {
        'username': usernameController,
        'password': passwordController,
        'confirmPassword': confirmPasswordController,
      },
    );

    Map<String, bool> formValidated = validate.validateForm();
    usernameEmpty = formValidated['username'];
    passwordEmpty = formValidated['password'];
    confirmPasswordEmpty = formValidated['confirmPassword'];

    update(['inputUsername', 'inputPassword', 'inputConfirmPassword']);

    return formValidated.values.contains(true) ? false : true;
  }

  Widget verifyRegisterWidget() {
    if (!loadingRegister) {
      return RoundedButton(
          text: "Cadastrar", press: () => validateForm() ? register() : null);
    }
    return const LoadingButton();
  }

  void register() async {
    loadRegister();
    Future.delayed(const Duration(milliseconds: 1000), () {
      loadRegister();
    });
  }
}
