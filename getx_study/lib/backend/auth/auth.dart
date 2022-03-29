// ignore_for_file: unrelated_type_equality_checks, missing_return, file_names

import '../fake_db.dart';

class AuthAPI {
  Future<Map<String, dynamic>> verifyUser(
      String username, String password) async {
    List<Map<String, dynamic>> arrayUsers = FakeData.responseApiLoginUser;

    print(arrayUsers);

    for (int i = 0; i < arrayUsers.length; i++) {
      String userUsername = arrayUsers[i]['user']['username'];
      String userPassword = arrayUsers[i]['user']['password'];

      if (userUsername == username && userPassword == password) {
        return arrayUsers[i];
      }

      if ((userUsername == username && userPassword != password) ||
          userUsername != username && userPassword == password) {
        userUsername == username ? throw 409 : throw 401;
      }
    }
    throw 404;
  }

  Future<Map<String, dynamic>> autenticateLogin(username, password) async {
    return await verifyUser(username, password);
  }
}
