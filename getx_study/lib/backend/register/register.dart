import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/model/user_model.dart';
import 'package:getx_study/backend/auth/auth.dart';
import 'dart:math';
import '../fake_db.dart';

class RegisterAPI {
  static const LOGIN_EXPIRES_IN = 3600;
  static const TOKEN_TYPE = 'bearer';

  Future<bool> validateRegister(User data, List<Map> arrayUsers) async {
    AuthAPI validateUser = AuthAPI();
    bool result;
    await validateUser
        .verifyUser(data.username, data.password)
        .then((value) => {result = false})
        .catchError((error) {
      if (error == 404) {
        result = true;
      } else if (error == 401) {
        for (int i = 0; i < arrayUsers.length; i++) {
          if (arrayUsers[i]['user']['username'] == data.username) {
            result = false;
            break;
          } else {
            result = true;
          }
        }
      }
    });
    return result;
  }

  User createNewUser(User userData, int newId) {
    return User(
      id: newId,
      username: userData.username,
      password: userData.password,
      activated: true,
    );
  }

  Auth createNewAuth(User newUser) {
    return Auth(
      user: newUser,
      accessToken: 'key' +
          Random().nextInt(10).toString() +
          Random().nextInt(100).toString(),
      tokenType: RegisterAPI.TOKEN_TYPE,
      expiresIn: RegisterAPI.LOGIN_EXPIRES_IN,
    );
  }

  Future<bool> registerUser(User userData) async {
    List<Map<String, dynamic>> arrayUsers = FakeData.responseApiLoginUser;
    bool validatedUser = await validateRegister(userData, arrayUsers);
    if (validatedUser) {
      int newIdUser = arrayUsers.last['user']['id'] + 1;
      User newUser = createNewUser(userData, newIdUser);
      Auth newAuthUser = createNewAuth(newUser);

      arrayUsers.add(newAuthUser.toJson());
      print(arrayUsers);
      return true;
    }
    throw 409;
  }
}
