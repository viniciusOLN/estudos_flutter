import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';
import 'package:getx_study/app/routes/app_routes.dart';
import 'package:getx_study/app/utils/validator_form.dart';
import 'package:getx_study/app/utils/widgets/loading.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';
import 'package:getx_study/backend/fake_db.dart';

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
  String textFieldEmpty;
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValidatorForm validate;
  AuthRepository repository = Get.find();
  Auth user;
  final box = GetStorage(Routes.STORAGEGET);

  void statePassword() {
    update(['inputPassword']);
    showPassword = !showPassword;
  }

  void loadLogin() {
    update(['loadingLogin']);
    loadingLogin = !loadingLogin;
  }

  void loadControllers() {
    validate = ValidatorForm(
      listControllersFields: {
        'username': usernameController,
        'password': passwordController,
      },
    );
  }

  bool validateForm() {
    textFieldEmpty = "Campo vazio!";
    loadControllers();
    Map<String, bool> formValidated = validate.validateForm();

    usernameEmpty = formValidated['username'];
    passwordEmpty = formValidated['password'];

    update(['inputUsername', 'inputPassword']);

    return formValidated.values.contains(true) ? false : true;
  }

  Widget verifyLoginWidget() {
    if (!loadingLogin) {
      return RoundedButton(
          text: "ENTRAR", press: () => validateForm() ? login() : null);
    }
    return const LoadingButton();
  }

  void login() async {
    loadLogin();
    print('aqui vai todo o login');
    List<Map<String, dynamic>> arrayUsers = FakeData.responseApiLoginUser;
    await repository
        .login(usernameController.text, passwordController.text)
        .then(
          (user) => {
            box.write('authUser', user),
            Get.offAllNamed('/home'),
          },
        )
        .catchError((error) {
      if (error == 404) {
        usernameEmpty = true;
        textFieldEmpty = "Usuário não cadastrado";
        update(['inputUsername']);
      }
      print(error);
    });
    // //using future just to test the change of 'loadingLogin' variable,
    //after using the async functions, this part will be removed.
    Future.delayed(const Duration(milliseconds: 1000), () {
      loadLogin();
    });
  }
}
