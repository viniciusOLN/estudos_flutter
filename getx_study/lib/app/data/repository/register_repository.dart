import 'package:getx_study/app/data/model/user_model.dart';
import 'package:getx_study/app/data/provider/register_provider.dart';

class RegisterRepository {
  final RegisterApiClient apiClient = RegisterApiClient();

  Future<bool> register(User newUserData) async {
    return await apiClient.register(newUserData);
  }
}
