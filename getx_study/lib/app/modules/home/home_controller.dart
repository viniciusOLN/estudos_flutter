import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_study/app/routes/app_routes.dart';

/* 
  O controller é a classe responsável por controlar todo o estado da view dele.
  Ele é responsável por pegar todos os dados que a repository retorna em forma de
  modelo da provider dentro da data.
*/

class HomeController extends GetxController {
  var count = 0.obs;
  void increment() => count++;
  final box = GetStorage(Routes.STORAGEGET);

  void clearStorageLogin() {
    box.erase();
    Get.offAllNamed('/welcome');
  }
}
