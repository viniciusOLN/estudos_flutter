import 'package:get/get.dart';
import 'package:getx_study/app/modules/rating/rating_controller.dart';

class RatingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RatingController());
  }
}
