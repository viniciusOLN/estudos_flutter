import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/signup/signup_controller.dart';
import 'package:getx_study/app/utils/widgets/alredy_have_account.dart';
import 'package:getx_study/app/utils/widgets/appbar_return_page.dart';
import 'package:getx_study/app/utils/widgets/background.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_field.dart';
import 'package:getx_study/app/utils/widgets/rounded_input_password.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarReturnPage.AppbarReturn,
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            //key: controller.formRegisterKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "REGISTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/signup.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                GetBuilder<SignUpController>(
                  id: 'inputUsername',
                  builder: (_) {
                    return RoundedInputField(
                      error: _.usernameEmpty,
                      errorMessage: _.errorMessageInputEmpty,
                      hintText: "Usuário",
                      controller: _.usernameController,
                      onChanged: (value) {},
                    );
                  },
                ),
                GetBuilder<SignUpController>(
                  id: 'inputPassword',
                  builder: (_) {
                    return RoundedPasswordField(
                      error: _.passwordEmpty,
                      errorMesage: _.errorMessageInputEmpty,
                      controller: _.passwordController,
                      showPassword: _.showPassword,
                      changeShowPassword: () => _.statePassword(),
                      hintText: "Senha",
                      onChanged: (e) {},
                    );
                  },
                ),
                GetBuilder<SignUpController>(
                  id: 'inputConfirmPassword',
                  builder: (_) {
                    return RoundedPasswordField(
                      error: _.confirmPasswordEmpty,
                      errorMesage: _.errorMessageConfirmPasswordEmpty,
                      controller: _.confirmPasswordController,
                      showPassword: _.showConfirmPassword,
                      changeShowPassword: () => _.stateConfirmPassword(),
                      hintText: "Confirmar senha",
                      onChanged: (e) {},
                    );
                  },
                ),
                SizedBox(height: Get.height * 0.01),
                GetBuilder<SignUpController>(
                  id: 'loadingButton',
                  builder: (_) {
                    return _.verifyRegisterWidget();
                  },
                ),
                SizedBox(height: Get.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: controller.redirectToLogin,
                ),
                SizedBox(height: Get.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
