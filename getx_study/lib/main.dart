import 'package:flutter/material.dart';
import 'package:getx_study/app/routes/app_pages.dart';
import 'package:getx_study/pagina_inicial.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
      title: 'App teste GetX',
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
      //initialBinding: ,
    );
  }
}
