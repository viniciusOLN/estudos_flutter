import 'package:get/get.dart';
import 'package:getx_study/app/modules/search/search_controller.dart';

class SearchBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
