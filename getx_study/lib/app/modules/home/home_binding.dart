import 'package:get/get.dart';
import 'package:getx_study/app/data/provider/schedule_provider.dart';
import 'package:getx_study/app/data/repository/schedule_repository.dart';
import 'package:getx_study/app/modules/home/controllers/custom_bar_controller.dart';
import 'package:getx_study/app/modules/home/home_controller.dart';
import 'package:getx_study/app/modules/profile/profile_controller.dart';
import 'package:getx_study/app/modules/search/search_controller.dart';

/*
  A binding é responsável por injetar dependências dentro da view.
  Dessa forma a gente não precisa instancias vários controllers, repositories ou providers
  dentro da mesma deixando um código poluído.
 */

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ScheduleRepository());
    Get.lazyPut(() => ScheduleApiClient());
    Get.lazyPut(() => ControllerCustomBar());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SearchController());
  }
}
