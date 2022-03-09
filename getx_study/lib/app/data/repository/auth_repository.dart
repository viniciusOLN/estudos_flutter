import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Auth login(String username, String password) {
    return Auth.fromJson(apiClient.login(username, password));
  }
}
