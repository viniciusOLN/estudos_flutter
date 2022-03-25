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
  String errorMessageConfirmPasswordEmpty = "Campo vazio!";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ValidatorForm validate;

  void statePassword() {
    update(['inputPassword']);
    showPassword = !showPassword;
  }

  void stateConfirmPassword() {
    update(['inputConfirmPassword']);
    showConfirmPassword = !showConfirmPassword;
  }

  void stateLoadingButtonRegister() {
    update(['loadingButton']);
    loadingRegister = !loadingRegister;
  }

  bool passwordAndConfirmPasswordDiferent() {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (password != confirmPassword &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      return true;
    }
    return false;
  }

  void loadControllers() {
    validate = ValidatorForm(
      listControllersFields: {
        'username': usernameController,
        'password': passwordController,
        'confirmPassword': confirmPasswordController,
      },
    );
  }

  bool validateForm() {
    loadControllers();
    Map<String, bool> formValidated = validate.validateForm();

    usernameEmpty = formValidated['username'];
    passwordEmpty = formValidated['password'];

    if (passwordAndConfirmPasswordDiferent()) {
      errorMessageConfirmPasswordEmpty = "Senha incorreta/diferente.";
      confirmPasswordEmpty = true;
      formValidated['confirmPassword'] = true;
    } else {
      errorMessageConfirmPasswordEmpty = "Campo vazio!";
      confirmPasswordEmpty = formValidated['confirmPassword'];
    }

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
    stateLoadingButtonRegister();
    Future.delayed(const Duration(milliseconds: 1000), () {
      stateLoadingButtonRegister();
    });
  }
}
