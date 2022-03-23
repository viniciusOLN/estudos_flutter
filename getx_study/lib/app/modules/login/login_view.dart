import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_study/app/modules/login/login_controller.dart';
import 'package:getx_study/app/utils/widgets/alredy_have_account.dart';
import 'package:getx_study/app/utils/widgets/appbar_return_page.dart';
import 'package:getx_study/app/utils/widgets/background.dart';
import 'package:getx_study/app/utils/widgets/loading.dart';
import 'package:getx_study/app/utils/widgets/rounded_button.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_field.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_password.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarReturnPage.AppbarReturn,
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            //key: controller.formLoginKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "ENTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/login.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                GetBuilder<LoginController>(
                  id: 'inputUsername',
                  builder: (_) {
                    return RoundedInputField(
                      hintText: 'Usuário',
                      controller: controller.usernameController,
                      onChanged: (value) {},
                      error: _.usernameEmpty,
                      errorMessage: _.textFieldEmpty,
                    );
                  },
                ),
                SizedBox(height: Get.height * 0.01),
                GetBuilder<LoginController>(
                  id: 'inputPassword',
                  builder: (_) {
                    return RoundedPasswordField(
                      error: _.passwordEmpty,
                      errorMesage: _.textFieldEmpty,
                      controller: _.passwordController,
                      showPassword: _.showPassword,
                      changeShowPassword: () =>
                          _.showPassword = _.statePassword(),
                      onChanged: (value) {},
                      hintText: "Senha",
                    );
                  },
                ),
                GetBuilder<LoginController>(
                    id: 'loadingLogin',
                    builder: (_) {
                      return _.verifyLoginWidget();
                    }),
                SizedBox(height: Get.height * 0.10),
                AlreadyHaveAnAccountCheck(
                  press: () => Get.toNamed('/signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
