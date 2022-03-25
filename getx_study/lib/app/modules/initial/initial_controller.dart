import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_study/app/routes/app_routes.dart';

/* 
  O controller é a classe responsável por controlar todo o estado da view dele.
  Ele é responsável por pegar todos os dados que a repository retorna em forma de
  modelo da provider dentro da data.
*/

class InitialController extends GetxController {
  final box = GetStorage(Routes.STORAGEGET);

  String autenticateAuth() {
    Map auth = box.read('authUser');
    return auth == null ? Routes.WELCOME : Routes.HOMEPAGE;
  }
}
