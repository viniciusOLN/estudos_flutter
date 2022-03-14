import 'package:getx_study/app/data/fake_data.dart';

/*
  O provider é a classe responsável por acessar os dados da api, nele se trata
  o retorno e os dados repassados pela api.
 */
class AuthApiClient {
  Map<String, dynamic> login(String name, String password) {
    Map<String, dynamic> fakeData = FakeData.responseApiLoginUser;

    try {
      if (name != fakeData['username'] && password != fakeData['password']) {
        throw 404;
      }
      return fakeData;
    } catch (e) {
      print('<provider>: error[${e}]');
    }
  }
}
