import 'package:getx_study/app/data/model/user_model.dart';
import 'package:getx_study/backend/register/register.dart';

class RegisterApiClient {
  Future<bool> register(User newUserData) async {
    RegisterAPI responseRegister = RegisterAPI();
    try {
      return await responseRegister.registerUser(newUserData);
    } catch (e) {
      rethrow;
    }
  }
}
