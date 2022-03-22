// ignore_for_file: unrelated_type_equality_checks, missing_return, file_names

import 'fake_db.dart';

class AuthAPI {
  Future<Map<String, dynamic>> verifyUser(
      List arrayUsers, String username, String password) async {
    for (int i = 0; i < arrayUsers.length; i++) {
      String userUsername = arrayUsers[i]['user']['username'];
      String userPassword = arrayUsers[i]['user']['password'];
      if (userUsername == username && userPassword == password) {
        return arrayUsers[i];
      }
      if ((userUsername == username && userPassword != password) ||
          userUsername != username && userPassword == password) {
        throw 401;
      }
      return throw 404;
    }
  }

  Future<Map<String, dynamic>> autenticateLogin(username, password) async {
    List<Map<String, dynamic>> responseDb = FakeData.responseApiLoginUser;
    return await verifyUser(responseDb, username, password);
  }
}
