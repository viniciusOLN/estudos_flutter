import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/provider/auth_provider.dart';

/*
  O repository é responsável por pegar todos os dados que a provider retorna e
   transformá-lo para um model, dessa forma ele retorna os dados em forma de um
   model para o controller e pode ser consumido na tela.
 */

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    Map<String, dynamic> json = await apiClient.login(username, password);
    return json != null ? Auth.fromJson(json) : null;
  }
}
