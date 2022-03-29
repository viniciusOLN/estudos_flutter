import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/data/model/user_model.dart';
import 'package:getx_study/app/data/repository/register_repository.dart';
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
  RegisterRepository repository = Get.find();

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
    //passar um user e nao auth no provider, no repository e acho q na api tbm
    User newUserData = User(
        username: usernameController.text.trim(),
        password: passwordController.text.trim());
    await repository
        .register(newUserData)
        .then((value) => print(value))
        .onError((error, stackTrace) => print(error));

    Future.delayed(const Duration(milliseconds: 1000), () {
      stateLoadingButtonRegister();
    });
  }
}
