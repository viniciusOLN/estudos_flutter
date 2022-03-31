import 'package:get/get.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';
import 'package:getx_study/app/modules/login/login_controller.dart';
import 'package:getx_study/app/modules/signup/signup_controller.dart';

class FormFields {
  static void clearLoginFields() {
    LoginController loginController = Get.put(LoginController());
    loginController.usernameController.clear();
    loginController.passwordController.clear();
  }

  static void clearSignUpFields() {
    SignUpController signUpController = Get.put(SignUpController());
    signUpController.usernameController.clear();
    signUpController.passwordController.clear();
    signUpController.confirmPasswordController.clear();
  }
}
