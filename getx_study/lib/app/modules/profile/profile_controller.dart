import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/app/modules/home/home_controller.dart';
import 'models/item_menu_profile.dart';

class ProfileController extends GetxController {
  final controllerHome = Get.find<HomeController>();

  String getUserFullName() {
    return controllerHome.auth.user.fullname;
  }

  List<ItemProfileMenu> listItemMenu = [
    ItemProfileMenu(
      title: 'Configurações',
      subtitle: 'Definição de privacidade',
      leading: 'assets/settings_icon.png',
      trailing: Icon(Icons.chevron_right),
    ),
    ItemProfileMenu(
      title: 'Ajuda & Suporte',
      subtitle: 'Centro de ajuda e suporte',
      leading: 'assets/support.png',
      trailing: Icon(Icons.chevron_right),
    ),
    ItemProfileMenu(
      title: 'Sair',
      subtitle: 'Retornar para a página de login',
      leading: 'assets/faq.png',
      trailing: Icon(Icons.chevron_right),
    ),
  ];
}
