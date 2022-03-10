import 'package:get/get.dart';
import 'package:getx_study/app/modules/initial/initial_controller.dart';

/*
  A binding é responsável por injetar dependências dentro da view.
  Dessa forma a gente não precisa instancias vários controllers, repositories ou providers
  dentro da mesma deixando um código poluído.
 */

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
  }
}
