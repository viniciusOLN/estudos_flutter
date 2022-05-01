import 'package:get/get.dart';
import 'package:getx_study/app/modules/config/config_biding.dart';
import 'package:getx_study/app/modules/config/config_view.dart';
import 'package:getx_study/app/modules/home/home_binding.dart';
import 'package:getx_study/app/modules/home/home_view.dart';
import 'package:getx_study/app/modules/initial/initial_binding.dart';
import 'package:getx_study/app/modules/initial/initial_view.dart';
import 'package:getx_study/app/modules/login/login_binding.dart';
import 'package:getx_study/app/modules/login/login_view.dart';
import 'package:getx_study/app/modules/payments/payments_binding.dart';
import 'package:getx_study/app/modules/payments/payments_view.dart';
import 'package:getx_study/app/modules/rating/rating_binding.dart';
import 'package:getx_study/app/modules/rating/rating_view.dart';
import 'package:getx_study/app/modules/schedules/schedules_binding.dart';
import 'package:getx_study/app/modules/schedules/schedules_view.dart';
import 'package:getx_study/app/modules/signup/signup_binding.dart';
import 'package:getx_study/app/modules/signup/signup_view.dart';
import 'package:getx_study/app/modules/support/support_binding.dart';
import 'package:getx_study/app/modules/support/support_view.dart';
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
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.PAYMENTS,
      page: () => PaymentsPage(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: Routes.SCHEDULES,
      page: () => SchedulesPage(),
      binding: SchedulesBinding(),
    ),
    GetPage(
      name: Routes.RATINGS,
      page: () => RatingPage(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: Routes.CONFIG,
      page: () => ConfigPage(),
      binding: ConfigBinding(),
    ),
    GetPage(
      name: Routes.SUPPORT,
      page: () => SupportPage(),
      binding: SupportBinding(),
    ),
  ];
}
