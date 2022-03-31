import 'package:get/get.dart';
import 'package:getx_study/app/data/provider/register_provider.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';
import 'package:getx_study/app/data/repository/register_repository.dart';
import 'package:getx_study/app/modules/signup/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<RegisterRepository>(() => RegisterRepository());
    Get.lazyPut<RegisterApiClient>(() => RegisterApiClient());
  }
}
