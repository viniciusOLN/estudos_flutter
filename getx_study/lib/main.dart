import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_study/app/modules/home/home_binding.dart';
import 'package:getx_study/app/modules/home/home_view.dart';
import 'package:getx_study/app/routes/app_pages.dart';
import 'package:getx_study/pagina_inicial.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';

void main() async {
  await GetStorage.init(Routes.STORAGEGET);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App teste GetX',
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
      //initialBinding: ,
    );
  }
}
