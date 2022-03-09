import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/home_binding.dart';
import 'package:getx_study/app/modules/home/home_view.dart';
import 'package:getx_study/app/routes/app_routes.dart';

/*
  Aqui ficam todas as rotas do aplicativo, com seus nomes, para qual página direcionar
  e se possui alguma dependencia que será injetada para não poluir a view com várias
  instâncias.
 */
class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
