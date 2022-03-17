import 'package:get/get.dart';
import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/model/user_model.dart';
import 'package:getx_study/app/data/repository/auth_repository.dart';

class WelcomeController extends GetxController {
  AuthRepository repository = Get.put(AuthRepository());
  Auth login;

  printdata() async {
    login = await repository.login("admin", "admin");
    if (login == null) {
      print(
          'email ou senha errados ou usario nao encontrando no banco de dados');
    } else {
      print('esse user existe!');
    }
  }
}
