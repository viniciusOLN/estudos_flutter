import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  bool statePassword() {
    update(['inputPassword']);
    return !showPassword;
  }

  bool stateConfirmPassword() {
    update(['inputConfirmPassword']);
    return !showConfirmPassword;
  }

  bool loadRegister() {
    update(['loadingButton']);
    loadingRegister = !loadingRegister;
    return null;
  }

  Widget verifyRegisterWidget() {
    if (!loadingRegister) {
      return RoundedButton(text: "Cadastrar", press: () => register());
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
