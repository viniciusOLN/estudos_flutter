import 'package:get/get.dart';

class PaymentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentsBinding());
  }
}
