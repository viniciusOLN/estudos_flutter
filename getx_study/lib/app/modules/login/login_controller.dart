import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';

/* 
  O controller é a classe responsável por controlar todo o estado da view dele.
  Ele é responsável por pegar todos os dados que a repository retorna em forma de
  modelo da provider dentro da data.
*/

class LoginController extends GetxController {
  final formLoginKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool loadingLogin = false;
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  String textFieldEmpty = "Campo vazio!";
  AuthRepository repository = Get.find();
  Auth user;

  bool statePassword() {
    update(['inputPassword']);
    return !showPassword;
  }

  bool loadLogin() {
    update(['loadingLogin']);
    loadingLogin = !loadingLogin;
    return null;
  }

  bool usernameFieldEmpty() {
    usernameEmpty = true;
    update(['inputUsername']);
    return null;
  }

  bool passwordFieldEmpty() {
    passwordEmpty = true;
    update(['inputPassword']);
    return null;
  }

  bool usernameFieldNotEmpty() {
    usernameEmpty = false;
    update(['inputUsername']);
    return null;
  }

  bool passwordFieldNotEmpty() {
    passwordEmpty = false;
    update(['inputPassword']);
    return null;
  }

  bool validateForm() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      usernameFieldNotEmpty();
      passwordFieldNotEmpty();
      return true;
    }
    if (usernameController.text.isEmpty && passwordController.text.isNotEmpty) {
      usernameFieldEmpty();
      passwordFieldNotEmpty();
    }
    if (usernameController.text.isNotEmpty && passwordController.text.isEmpty) {
      usernameFieldNotEmpty();
      passwordFieldEmpty();
    }
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      usernameFieldEmpty();
      passwordFieldEmpty();
    }
    return false;
  }

  login() async {
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
