import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';
import 'package:getx_study/app/utils/validator_form.dart';
import 'package:getx_study/app/utils/widgets/loading.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';

/* 
  O controller é a classe responsável por controlar todo o estado da view dele.
  Ele é responsável por pegar todos os dados que a repository retorna em forma de
  modelo da provider dentro da data.
*/

class LoginController extends GetxController {
  bool showPassword = false;
  bool loadingLogin = false;
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  String textFieldEmpty = "Campo vazio!";
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValidatorForm validate;
  AuthRepository repository = Get.find();
  Auth user;

  void statePassword() {
    update(['inputPassword']);
    showPassword = !showPassword;
  }

  void loadLogin() {
    update(['loadingLogin']);
    loadingLogin = !loadingLogin;
  }

  bool validateForm() {
    validate = ValidatorForm(
      listControllersFields: {
        'username': usernameController,
        'password': passwordController,
      },
    );

    Map<String, bool> formValidated = validate.validateForm();

    usernameEmpty = formValidated['username'];
    passwordEmpty = formValidated['password'];

    update(['inputUsername', 'inputPassword']);

    return validate.resultValidationForm(formValidated);
  }

  Widget verifyLoginWidget() {
    if (!loadingLogin) {
      return RoundedButton(text: "ENTRAR", press: () => login());
    }
    return const LoadingButton();
  }

  void login() async {
    if (validateForm()) {
      loadLogin();
      print('aqui vai todo o login');
      await repository
          .login(usernameController.text, passwordController.text)
          .then((value) => print('deu certo ó'))
          .catchError((e) {
        print(e);
      });
      // //using future just to test the change of 'loadingLogin' variable,
      //after using the async functions, this part will be removed.
      Future.delayed(const Duration(milliseconds: 1000), () {
        loadLogin();
      });
    }
  }
}
