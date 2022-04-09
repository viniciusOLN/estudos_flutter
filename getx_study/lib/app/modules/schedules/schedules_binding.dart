import 'package:get/get.dart';
import 'package:getx_study/app/modules/schedules/schedules_controller.dart';

class SchedulesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchedulesController());
  }
}
