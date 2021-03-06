import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_study/app/data/model/auth_model.dart';
import 'package:getx_study/app/data/model/schedule_model.dart';
import 'package:getx_study/app/data/repository/schedule_repository.dart';
import 'package:getx_study/app/modules/search/search_controller.dart';
import 'package:getx_study/app/routes/app_routes.dart';
import 'package:getx_study/app/utils/widgets/dialog_notification.dart';

/* 
  O controller é a classe responsável por controlar todo o estado da view dele.
  Ele é responsável por pegar todos os dados que a repository retorna em forma de
  modelo da provider dentro da data.
*/

class HomeController extends GetxController {
  final box = GetStorage(Routes.STORAGEGET);
  final repository = Get.find<ScheduleRepository>();
  final searchController = Get.put(SearchController());
  List<Schedule> listSchedules = [];
  Auth auth = Auth();

  @override
  void onInit() async {
    loadData();
    auth = Auth.fromJson(box.read('authUser'));
    LocationPermission permission = await Geolocator.requestPermission();
    searchController.getUserLocation();
    super.onInit();
  }

  void loadData() async {
    await repository.getAll().then(
      (value) {
        listSchedules = value;
        update(['listSchedules']);
      },
    ).onError(
      (error, stackTrace) {
        return CustomNotification.showNotification(
          "ERRO",
          "Erro de conexão, tente novamente!",
        );
      },
    );
  }

  void logout() {
    box.erase();
    Get.offAllNamed('/welcome');
  }
}
