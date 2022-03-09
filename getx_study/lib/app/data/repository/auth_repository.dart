import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/provider/auth_provider.dart';

/*
  O repository é responsável por pegar todos os dados que a provider retorna e
   transformá-lo para um model, dessa forma ele retorna os dados em forma de um
   model para o controller e pode ser consumido na tela.
 */

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Auth login(String username, String password) {
    return Auth.fromJson(apiClient.login(username, password));
  }
}
