import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/home_binding.dart';
import 'package:getx_study/app/modules/home/home_view.dart';
import 'package:getx_study/app/modules/initial/initial_binding.dart';
import 'package:getx_study/app/modules/initial/initial_view.dart';
import 'package:getx_study/app/modules/login/login_binding.dart';
import 'package:getx_study/app/modules/login/login_view.dart';
import 'package:getx_study/app/modules/signup/signup_view.dart';
import 'package:getx_study/app/modules/welcome/welcome_binding.dart';
import 'package:getx_study/app/modules/welcome/welcome_view.dart';
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
      name: Routes.HOMEPAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: INITIAL,
      page: () => InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpPage(),
    ),
  ];
}
