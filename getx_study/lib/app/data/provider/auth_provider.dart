import 'package:getx_study/backend/auth/auth.dart';

/*
  O provider é a classe responsável por acessar os dados da api, nele se trata
  o retorno e os dados repassados pela api.
 */

class AuthApiClient {
  Future<Map<String, dynamic>> login(String name, String password) async {
    AuthAPI responseApi = AuthAPI();
    try {
      return await responseApi.autenticateLogin(name, password);
    } catch (e) {
      rethrow;
    }
  }
}
