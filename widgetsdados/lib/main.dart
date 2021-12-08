import 'package:flutter/material.dart';
import 'package:widgetsdados/tela_secundaria.dart';
import 'pagina_principal.dart';
import 'radio_buttons.dart';
import 'switch_estudo.dart';
import 'slider_estudo.dart';
import 'navegacao_telas.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with Routes {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testando inputs',
      home: Navegacao(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes(),
    );
  }
}
