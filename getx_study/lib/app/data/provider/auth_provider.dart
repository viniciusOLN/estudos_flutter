import 'package:getx_study/app/data/fake_data.dart';

class AuthApiClient {
  Map<String, dynamic> login(String name, String password) {
    Map<String, dynamic> fakeData = FakeData.responseApiLoginUser;
    if (name != fakeData['username'] && password != fakeData['password']) {
      throw 404;
    }
    return fakeData;
  }
}
