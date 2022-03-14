import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:getx_study/app/data/provider/auth_provider.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';
import 'package:getx_study/app/modules/login/login_controller.dart';

/*
  A binding é responsável por injetar dependências dentro da view.
  Dessa forma a gente não precisa instancias vários controllers, repositories ou providers
  dentro da mesma deixando um código poluído.
 */

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
