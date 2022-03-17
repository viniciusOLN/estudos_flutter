import 'package:getx_study/app/data/fake_data.dart';
import 'package:http/http.dart';

/*
  O provider é a classe responsável por acessar os dados da api, nele se trata
  o retorno e os dados repassados pela api.
 */
class AuthApiClient {
  Future<Map<String, dynamic>> login(String name, String password) async {
    Map<String, dynamic> fakeData = FakeData.responseApiLoginUser;

    try {
      if (name != fakeData['user']['username'] ||
          password != fakeData['user']['password']) {
        return null;
      }
      return fakeData;
    } catch (e) {
      print('<auth provider>: ' + e);
    }
  }
}
